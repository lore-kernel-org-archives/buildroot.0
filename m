From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 20:04:53 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
In-Reply-To: <20090129172116.F10B076D75@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Thu\, 29 Jan 2009 17\:21\:16 +0000 \(UTC\)")
References: <20090129172116.F10B076D75@busybox.osuosl.org>
Message-ID: <87bptqq6ga.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-29 17:21:16 +0000 (Thu, 29 Jan 2009)
 ulf> New Revision: 25124

 ulf> Log:
 ulf> Remove unneeded ARM architecure patch, just a clone of SAM9260 support

 ulf> Removed:
 ulf>    trunk/buildroot/target/device/ARM/

 ulf> Modified:
 ulf>    trunk/buildroot/target/device/Config.in


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/target/device/Config.in
 ulf> ===================================================================
 ulf> --- trunk/buildroot/target/device/Config.in	2009-01-29 17:05:12 UTC (rev 25123)
 ulf> +++ trunk/buildroot/target/device/Config.in	2009-01-29 17:21:16 UTC (rev 25124)
 ulf> @@ -7,8 +7,6 @@
 ulf>  source "target/device/AMD/Config.in"
 ulf>  source "target/device/ARMLTD/Config.in"
 ulf>  source "target/device/Atmel/Config.in"
 ulf> -source "target/device/Hitachi/Config.in"
 ulf> -source "target/device/jp/Config.in"

Huh? What does those have to do with $SUBJECT?

-- 
Bye, Peter Korsgaard
