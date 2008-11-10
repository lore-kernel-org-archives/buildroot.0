From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Mon, 10 Nov 2008 20:15:30 +0100
Subject: [Buildroot] [buildroot 0006104]: midori libtool patch fails to
	apply
In-Reply-To: <061E11D86E3DFF459604DF5B36F0805F1BA6E6@salka01.valka.local>
References: <b004640077fb58ca7ca36d5b085a6576@busybox.net>
	<061E11D86E3DFF459604DF5B36F0805F1BA6E6@salka01.valka.local>
Message-ID: <e4c675870811101115r4f6418c1scf73ab837978cda8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This seems interesting as midori substitute:

http://trac.webkit.org/wiki/S60Webkit

Probably the fastest way to compile midori is to build a complete
development environment and use it.

Compile a cross toolchain in order to build a building environment in
which compile everything natively, umh... :-p

I think it would resolve a lot of problem but it would be seriously
limited to those $ARCH which runs onto qemu properly.

2008/11/10 Arnar Mar Sigur?sson <antab@valka.is>:
> Is anyone using this package?
>
> 0.0.18 is missing alot of features and was only semi usable on AVR32.
> After version 0.0.18 they moved to a new python based build system that i
> have been unable to get working within buildroot so i gave up on it.
>
> IMO if nobody wants to spend time getting the new version working, then we
> should just remove it.
>
> Greets
>    Arnar Mar Sig
>
> -----Original Message-----
> From: buildroot-bounces at uclibc.org on behalf of bugs at busybox.net
> Sent: Mon 11/10/2008 5:48 PM
> To: buildroot at uclibc.org
> Subject: [Buildroot] [buildroot 0006104]: midori libtool patch fails to
> apply
>
>
> The following issue has been SUBMITTED.
> ======================================================================
> http://busybox.net/bugs/view.php?id=6104
> ======================================================================
> Reported By:                robang74
> Assigned To:                buildroot
> ======================================================================
> Project:                    buildroot
> Issue ID:                   6104
> Category:                   Shared Library Support
> Reproducibility:            always
> Severity:                   major
> Priority:                   normal
> Status:                     assigned
> ======================================================================
> Date Submitted:             11-10-2008 09:48 PST
> Last Modified:              11-10-2008 09:48 PST
> ======================================================================
> Summary:                    midori libtool patch fails to apply
> Description:
>>>> midori 0.0.18 Extracting
>>>> midori 0.0.18 Patching libtool
>
> Applying buildroot-libtool.patch using plaintext:
> patching file ltmain.sh
> Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 273.
> Hunk http://busybox.net/bugs/view.php?id=2 succeeded at 4811 (offset 2403
> lines).
> Hunk http://busybox.net/bugs/view.php?id=3 FAILED at 4955.
> Hunk http://busybox.net/bugs/view.php?id=4 FAILED at 5299.
> Hunk http://busybox.net/bugs/view.php?id=5 succeeded at 7415 with fuzz 1
> (offset
> 1792 lines).
> Hunk http://busybox.net/bugs/view.php?id=6 FAILED at 7740.
> 4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
> Patch failed!  Please fix buildroot-libtool.patch!
> make: ***
> [/home/roberto/gles/buildroot/build_i586/midori-0.0.18/.stamp_libtool_patch]
> Error 1
>
> ======================================================================
>
> Issue History
> Date Modified   Username       Field                    Change
> ======================================================================
> 11-10-08 09:48  robang74       New Issue
> 11-10-08 09:48  robang74       Status                   new => assigned
> 11-10-08 09:48  robang74       Assigned To               => buildroot
> ======================================================================
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>



-- 
/roberto
