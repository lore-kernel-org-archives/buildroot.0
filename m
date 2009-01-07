From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jan 2009 09:10:09 +0100
Subject: [Buildroot] Which u-boot/buildroot version for ppc8272?
In-Reply-To: <loom.20090106T224840-114@post.gmane.org> (Daniel Ng's message of
	"Tue\, 6 Jan 2009 22\:53\:33 +0000 \(UTC\)")
References: <loom.20090106T043218-43@post.gmane.org>
	<87ljtovpem.fsf@macbook.be.48ers.dk>
	<loom.20090106T224840-114@post.gmane.org>
Message-ID: <87bpujmt9a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Ng <daniel_ng11@lycos.com> writes:

 Daniel> Hi Peter,

 Daniel> I've just tried the latest (buildroot-20090106.tar.bz2) but get the same error-

 Daniel> make[1]: Entering directory 
 Daniel> `/home/dng/buildroot/project_build_powerpc/uclibc/u-boot-2009.01-rc1'
 Daniel> make[1]: *** No rule to make target `_config'.  Stop.

I suspect you haven't set BR2_TARGET_UBOOT_BOARDNAME to your u-boot
config.

-- 
Bye, Peter Korsgaard
