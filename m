From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 10 Jul 2008 15:31:43 +0200
Subject: [Buildroot] Makefile.autotools.in problems
In-Reply-To: <87y74aqiyy.fsf@macbook.be.48ers.dk>
References: <18377517.post@talk.nabble.com>
	<87y74aqiyy.fsf@macbook.be.48ers.dk>
Message-ID: <48760F3F.6030406@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Peter Korsgaard skrev:
>>>>>> "Daniel" == Daniel Laird <daniel.j.laird@nxp.com> writes:
> 
> Hi,
> 
>  Daniel> This is only a problem as I have not deleted patches
>  Daniel> associated with an old version.  However I wanted to raise
>  Daniel> the issue in case it was originally planned that you could
>  Daniel> have multiple patches in the directory for different versions
>  Daniel> and it would apply only those patches that match.
> 
> Yes, the Makefile.autotools.in is kinda half baked still.
> 
>  Daniel> Perhaps we could have a PKG_STRICT_PATCH variable.  That if
>  Daniel> set to true would only apply patches that match the version
>  Daniel> string, if not set it would apply all patches.
> 
> That or put the patches in version specific sub directories like
> openembedded does.
> 
I vote for the latter.

BR
ulf Samuelsson

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIdg8/AyRRH5cXxqwRAmzjAJ4p57bU6fsdPWkpfyFHhzdTw587agCeIAkn
4JGH6fXyR/gHE24lpqg5kEM=
=EBnh
-----END PGP SIGNATURE-----
