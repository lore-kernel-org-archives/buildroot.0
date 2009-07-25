From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Jul 2009 08:41:11 +0200
Subject: [Buildroot] [git commit] CHANGES: add #163 + #473
In-Reply-To: <4A69FBB3.4080300@tensilica.com> (Maxim Grigoriev's message of
	"Fri\, 24 Jul 2009 11\:21\:39 -0700")
References: <20090724055230.2080B77660@busybox.osuosl.org>
	<20090724110230.3f51597a@surf> <87zlauutcd.fsf@macbook.be.48ers.dk>
	<20090724153528.7103ad9d@surf>
	<522C1DF17AF50042AD8AE87F7887BD3D015DF9AD0A@exch.hq.tensilica.com>
	<87fxcmuqtx.fsf@macbook.be.48ers.dk> <4A69FBB3.4080300@tensilica.com>
Message-ID: <87iqhh9se0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxim" == Maxim Grigoriev <maxim@tensilica.com> writes:

 Maxim> I've attached the patch.
 Maxim> Thanks much for working on this.

Great. Your patch seems to have gotten corrupted by the mailer, but I
applied it by hand.

 Maxim> Author: Maxim Grigoriev <maxim@tensilica.com>  2009-07-24 11:10:14
 Maxim> Committer: Maxim Grigoriev <maxim@tensilica.com>  2009-07-24 11:10:14
 Maxim> Parent: 5d79f6caf0d62a3458c4911489d684ba13b52e95 (TODO: remove outdated stuff)
 Maxim> Branch: master
 Maxim> Follows: 2009.05
 Maxim> Precedes: 

 Maxim>     [XTENSA] Remove Copyright notes. They contradict GPL license.
    
 Maxim>     Signed-off-by: Maxim Grigoriev <maxim@tensilica.com>

 Maxim> ------------------ target/xtensa/xt-buildroot-overlay-install ------------------
 Maxim> index 254da10..d2afce1 100644
 Maxim> @@ -19,13 +19,7 @@ exit $?
 Maxim>  #	<xtensa_root>/src/xtensa-config-overlay.tar.gz
 Maxim>  #  where <xtensa_root> is the path to the Tensilica Core Package.
 Maxim>  #
 Maxim> -# Copyright (c) 2003-2008 by Tensilica Inc.  ALL RIGHTS RESERVED.
 Maxim> -# These coded instructions, statements, and computer programs are the
 Maxim> -# copyrighted works and confidential proprietary information of Tensilica Inc.
 Maxim> -# They may not be modified, copied, reproduced, distributed, or disclosed to
 Maxim> -# third parties in any manner, medium, or form, in whole or in part, without
 Maxim> -# the prior written consent of Tensilica Inc.
 Maxim> -#
 Maxim> +# Copyright (c) 2003-2009 by Tensilica Inc.
 Maxim>  #  History:
 Maxim>  #  2007-NOV-08	1.0	meg	Initial version
 Maxim>  #  2007-NOV-21	1.1	meg	Add -k parameter

-- 
Bye, Peter Korsgaard
