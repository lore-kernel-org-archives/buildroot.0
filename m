From: James J. Dines <jdines@jdines.net>
Date: Tue, 07 Sep 2010 16:55:44 -0400
Subject: [Buildroot] OT: how to do upgrades with ipkg?
In-Reply-To: <i6680v$ahj$1@dough.gmane.org>
References: <i6680v$ahj$1@dough.gmane.org>
Message-ID: <4C86A6D0.7070602@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/07/2010 04:41 PM, Grant Edwards wrote:
> First, my apologies.  This isn't directly related to buildroot, but
> I'm hoping somebody might know the answer (there doesn't seem to be an
> ipkg mailing list).
> 
> When using ipkg to manage field-installed pacakges, how do you upgrade
> a package?  For example, let's say I've got foobar version 0.1
> installed.  Now I have foobar_0.2_arm.ipk at hand on the target.  How
> do I upgrade?
> 
> The "ipkg upgrade" command doesn't seem relevent -- it won't accept a
> path to an .ipk file.  There are no "feeds" in my system.  All packages
> are explicitly uploaded to the target and installed.
> 
> Do you just do this?
> 
>   ipkg remove foobar
>   ipkg install foobar_0.2_arm.ipk
> 

On a related note, wouldn't it make more sense to migrate to opkg at
this point?  http://en.wikipedia.org/wiki/Opkg

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMhqbNAAoJECSpOhdQESq66rkH/0TclZj56eKEkoZJFA1XSh37
4nTt4yXMZOjDjMwtKYwOee3G04qJnx4dboNEyz4Z1oL6YPEEE+ROIBi5pTzni4oD
AA+b+erNmVSnNr1riKoQ7QTaxbbiijaSXPOshvp0FlXJ7HcS92tnahGdYpAuXfza
wYWO82ACjlafotWEZ3ZeP2jxIiAIkz5aQ5ESjqlLXQyWCgmt5RxE0O1Wf3ujjPEs
KufiQFLf0Tnt311ADLXfaub3ucsdnrRh1g6YRpXELXQpX7raR1gVCy2RMNRJOeFv
q+3H88dQ1Bvp+YKtK3CeOiCsUfUh7PA0/rCml1WA772nr/VPQCxbUZ6QcBAq7+U=
=45ID
-----END PGP SIGNATURE-----
