From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Sat, 07 Jul 2007 10:49:09 -0500
Subject: [Buildroot] <package>_VER vs <package>_VERSION
In-Reply-To: <004201c7c0a2$9420c900$dcc4af0a@atmel.com>
References: <004201c7c0a2$9420c900$dcc4af0a@atmel.com>
Message-ID: <468FB5F5.1070205@realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ulf Samuelsson wrote:
> Some packages use <package>_VER  and some use  <package>_VERSION
> and some does not use this at all and hardcodes the version.
> 
> Suggest we clean this up so we use a single template.
> 
> Suggest we do it using the following template, allowing user to override.
> 
> ifeq    ($(<package>_VERSION),)
> <package>_VERSION:=X.Y.Z
> endif
> 
That's an interesting idea. I agree on the _VER and _VERSION clean-up. How
about you submit a patch for that first? Thanks.

- -Steve
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGj7X0gyK5H2Ic36cRAu92AJ4mfebEMjXncg6Kowy2WqmBx3DoggCgnnbd
8dee0MadkFPEocP/w+jb/3c=
=9bR2
-----END PGP SIGNATURE-----
