From: Scott Reese <sreese@indianaheart.org>
Date: Thu, 09 Nov 2006 07:50:09 -0500
Subject: [Buildroot] Buildroot on Ubuntu 6.10
In-Reply-To: <20061108075309.GA23542@codepoet.org>
References: <45512EAC.9030703@indianaheart.org>
	<20061108075309.GA23542@codepoet.org>
Message-ID: <45532401.6020000@indianaheart.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Erik Andersen wrote:
> On Tue Nov 07, 2006 at 08:11:08PM -0500, Scott Reese wrote:
>> In any event, just changing the /bin/sh link from dash to bash fixed all
>> of my problems with no noticeable problems on the workstation.  If
>> you're having problems building on a Ubuntu 6.10 system, that's a good
>> place to start.
> 
> I'm running ubuntu 6.10 on my box, with /bin/sh pointing
> to dash, and thus far I've not had any serious problems.
> If you have specific failures, I'd love to know about them,
> 
>  -Erik
> 
> --
> Erik B. Andersen             http://codepoet-consulting.com/
> --This message was written using 73% post-consumer electrons--


Greetings:

I spent the entire evening trying to reproduce the problem and could
not.  I was having problems in the binutils build.  It was failing to
compile the documentation.  I'm willing to chalk it up to some other
problem with the 6.06->6.10 upgrade.  I lost the unifdef package
somewhere in the upgrade process, but removing it didn't cause the
problem to come back, so that wasn't it.

Sorry to waste everyone's time.

- -Scott
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFUyQBS7FYdPX6+iYRAjRkAKCbSYjX3Nd+/OF9IS1yAtNhkxTQBACcC1BX
aFXO97NYL49YGXfqT68GpV4=
=hz03
-----END PGP SIGNATURE-----
