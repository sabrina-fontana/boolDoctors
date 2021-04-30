<?php

use Illuminate\Database\Seeder;
use App\User;
use App\Specialization;
use App\Service;
use App\Message;
use App\Review;
use App\Sponsorship;
use Faker\Generator as Faker;
use Illuminate\Support\Facades\Hash;

class DocSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(Faker $faker)
    {

        $serArray = [
            [
                'service_type' => 'Prima visita',
                'service_price' => 19.99,
                'service_address' => $faker->address(),
            ],
            [
                'service_type' => 'Visita di controllo',
                'service_price' => 29.99,
                'service_address' => $faker->address(),
            ],
            [
                'service_type' => 'Visita approfondita',
                'service_price' => 59.99,
                'service_address' => $faker->address(),
            ]
        ];

        $specArray = Specialization::all();
        $sponsArray = Sponsorship::all();

        for ($i = 0; $i < rand(30, 100); $i++) {
            $newDoctor = new User();
            $newDoctor->name = $faker->firstname();
            $newDoctor->lastname = $faker->lastname();
            $newDoctor->email = $faker->email();
            $newDoctor->address = $faker->address();
            $newDoctor->password = Hash::make('paperino');
            $newDoctor->save();


            $randSpec = [];

            for ($x = 0; $x < rand(1, 2); $x++) {

                $docSpec = rand(1, count($specArray));
                if (!in_array($docSpec, $randSpec)) {
                    array_push($randSpec, $docSpec);
                }
            }

            foreach ($randSpec as $z) {
                $newDoctor->specializations()->attach($z);
            }

            for ($s = 0; $s < rand(1, count($serArray)); $s++) {
                $newService = new Service();
                $newService->fill($serArray[$s]);
                $newDoctor->services()->save($newService);
            }

            for ($m = 0; $m < rand(2, 5); $m++) {
                $newMessage = new Message();
                $newMessage->msg_name = $faker->firstname();
                $newMessage->msg_lastname = $faker->lastname();
                $newMessage->msg_email = $faker->email();
                $newMessage->msg_phone_number = '333333333';
                $newMessage->msg_content = $faker->text(144);
                $newDoctor->messages()->save($newMessage);
            }

            for ($r = 0; $r < rand(2, 5); $r++) {
                $newReview = new Review();
                $newReview->rv_vote = rand(1, 5);
                $newReview->rv_title = $faker->sentence(5);
                $newReview->rv_content = $faker->text(144);
                $newDoctor->reviews()->save($newReview);
            }

            for ($sp = 0; $sp < rand(1, 5); $sp++) {
                $newDoctor->sponsorships()->attach(rand(1, count($sponsArray)));
            }
        }
    }
}
