From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Mar 2012 20:47:14 +0100
Subject: [Buildroot] [PATCH] elf2flt: fix after conversion of binutils
	to package infrastructure
In-Reply-To: <20120318165838.7596efeb@skate> (Thomas Petazzoni's message of
 "Sun, 18 Mar 2012 16:58:38 +0100")
References: <CAFm-AyppuS3y-oHUHj_Xz1u+JB2qLDKmHVF4MQV-8=8u9cwwEw@mail.gmail.com>
 <1332084958-1085-1-git-send-email-arnout@mind.be>
 <20120318165838.7596efeb@skate>
Message-ID: <87y5qxn131.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Probably it should be converted to autotargets as well.  However, I
 >> don't know how to test if the resulting tool still works.

 Thomas> I have started setting up an environment for a noMMU ARM kernel and
 Thomas> userspace that runs under the SkyEye emulator. I intend to clean this
 Thomas> up and make it available as a defconfig so that we have at least one
 Thomas> noMMU environment we can use for testing.

 Thomas> So far I have something that boots into a Busybox userspace, but it is
 Thomas> built with the Soucery CodeBench uClinux toolchain. I think I will
 Thomas> clean it up as is, we can see later if the internal toolchain backend
 Thomas> works to build a correct toolchain for this usecase.

Great, sounds good. I don't have any experience with skyeye, any
specific reasons to use that instead of qemu?

-- 
Bye, Peter Korsgaard
