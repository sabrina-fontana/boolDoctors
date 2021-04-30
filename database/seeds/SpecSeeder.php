<?php

use Illuminate\Database\Seeder;
use App\Specialization;
use App\Sponsorship;

class SpecSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $specArray = [
            'Agopuntore',
            'Allergologo',
            'Anatomopatologo',
            'Andrologo',
            'Anestesista',
            'Angiologo',
            'Audioprotesista',
            'Cardiochirurgo',
            'Cardiologo',
            'Chiropratico',
            'Chirurgo',
            'Chirurgo Estetico',
            'Chirurgo Generale',
            'Chirurgo Maxillo Facciale',
            'Chirurgo Pediatrico',
            'Chirurgo Plastico',
            'Chirurgo Toracico',
            'Chirurgo Vascolare',
            'Chirurgo Vertebrale',
            'Covidtest',
            'Dentista',
            'Dermatologo',
            'Diabetologo',
            'Dietista',
            'Dietologo',
            'Ematologo',
            'Endocrinologo',
            'Epatologo',
            'Epidemiologo',
            'Fisiatra',
            'Fisioterapista',
            'Gastroenterologo',
            'Geriatra',
            'Ginecologo',
            'Immunologo',
            'Infettivologo',
            'Internista',
            'Logopedista',
            'Massofisioterapista',
            'Medico Certificatore',
            'Medico Competente',
            'Medico Dello Sport',
            'Medico Di Base',
            'Medico Estetico',
            'Medico Genetista',
            'Medico Legale',
            'Medico Nucleare',
            'Nefrologo',
            'Neurochirurgo',
            'Neurologo',
            'Neuropsichiatra Infantile',
            'Nutrizionista',
            'Oculista',
            'Omeopata',
            'Oncologo',
            'Ortodontista',
            'Ortopedico',
            'Osteopata',
            'Ostetrica',
            'Otorino',
            'Pediatra',
            'Pneumologo',
            'Podologo',
            'Posturologo',
            'Proctologo',
            'Professional Counselor',
            'Psichiatra',
            'Psicologo',
            'Psicologo Clinico',
            'Psicoterapeuta',
            'Radiologo',
            'Radiologo Diagnostico',
            'Radioterapista',
            'Reumatologo',
            'Senologo',
            'Sessuologo',
            'Stomatologo',
            'Tecnico Sanitario',
            'Terapeuta',
            'Terapista Del Dolore',
            'Urologo',
            'Venereologo'
        ];

        $sponsArray = [
            [
                'sponsor_name' => 'Base',
                'sponsor_duration' => 24,
                'sponsor_price' => 2.99
            ],
            [
                'sponsor_name' => 'Intermedio',
                'sponsor_duration' => 72,
                'sponsor_price' => 5.99
            ],
            [
                'sponsor_name' => 'Premium',
                'sponsor_duration' => 144,
                'sponsor_price' => 9.99
            ]
        ];

        foreach ($specArray as $spec) {
            $newSpec = new Specialization();
            $newSpec->spec_name = $spec;
            $newSpec->save();
        }



        foreach ($sponsArray as $spons) {
            $newSponsor = new Sponsorship();
            $newSponsor->fill($spons);
            $newSponsor->save();
        }
    }
}
