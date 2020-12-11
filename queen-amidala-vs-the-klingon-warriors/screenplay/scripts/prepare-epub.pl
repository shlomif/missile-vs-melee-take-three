#!/usr/bin/perl

use strict;
use warnings;

use utf8;

use Shlomif::Screenplays::EPUB;

my $gfx = 'who-is-qoheleth.svg.png';

my @images =
(
    $gfx,
    'Friends-S02E04--Nothing-Sexier.svg.jpg',
    'If-You-Wanna-Be-Sad.svg.jpg',
    'sigourney-weaver--resized.jpg',
    'summer-glau--two-guns--400w.jpg',
);

my $obj = Shlomif::Screenplays::EPUB->new(
    {
        images =>
        {
            (map { $_ => "images/$_", } @images),
        },
    }
);

$obj->run;

{
    my $epub_basename = 'So-Who-the-Hell-is-Qoheleth';
    $obj->epub_basename($epub_basename);

    $obj->output_json(
        {
            data =>
            {
                filename => $epub_basename,
                title => q{“So, Who the Hell is Qoheleth?”},
                authors =>
                [
                    {
                        name => "Shlomi Fish",
                        sort => "Fish, Shlomi",
                    },
                ],
                contributors =>
                [
                    {
                        name => "Shlomi Fish",
                        role => "oth",
                    },
                ],
                cover => "images/$gfx",
                rights => "Creative Commons Attribution Noncommercial ShareAlike Unported (CC-by-nc-sa-3.0)",
                publisher => 'http://www.shlomifish.org/',
                language => 'en-GB',
                subjects => [ 'FICTION/Humorous', 'Judaism', 'Bible', ],
                identifier =>
                {
                    scheme => 'URL',
                    value => 'http://localhost/shlomif/homepage-local/humour/So-Who-The-Hell-Is-Qoheleth/',
                },
            },
        },
    );
}
