// Coded by Eliot Van Uytfanghe @ 2010.
Class EditPackagesCommandlet Extends Commandlet;

event int Main( string Parms )
{
	local bool bAdd;
	local string PackageName;
	local int i;
	
	Log( Parms, name );
	bAdd = Left( Parms, 1 ) == "1";
	PackageName = Mid( Parms, 2 );
	if( bAdd )
	{
		Log( "Adding" @ PackageName, name );
		// Already added?
		for( i = 0; i < Class'EditorEngine'.Default.EditPackages.Length; ++ i )
		{
			if( Class'EditorEngine'.Default.EditPackages[i] ~= PackageName )
			{
				return 0;
			}
		}

		Class'EditorEngine'.Default.EditPackages[Class'EditorEngine'.Default.EditPackages.Length] = PackageName;
		Class'EditorEngine'.Static.StaticSaveConfig();
	}
	else
	{
		Log( "Removing" @ PackageName, name );
		for( i = 0; i < Class'EditorEngine'.Default.EditPackages.Length; ++ i )
		{
			if( Class'EditorEngine'.Default.EditPackages[i] ~= PackageName )
			{
				Class'EditorEngine'.Default.EditPackages.Remove( i, 1 );
				//break;
			}
		}
		Class'EditorEngine'.Static.StaticSaveConfig();
	}
}