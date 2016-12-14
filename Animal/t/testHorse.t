use Test::More;

BEGIN {use_ok('Horse')}

my $trigger = Horse->named("Trigger");
isa_ok($trigger, "Horse");

my $tv_horse = Horse->named("Mr. Ed");
isa_ok($tv_horse, "Horse");

is($trigger->name, "Trigger", "Trigger's name is correct");
is($tv_horse->name, "Mr. Ed", "Mr. Ed 's name is correct");
is(Horse->name, "An unamed Horse");


done_testing();
