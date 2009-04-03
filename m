From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 03 Apr 2009 14:42:41 +0200
Subject: [Buildroot] [NEWBIE] Disable U-Boot
In-Reply-To: <39f1c8d30904030431m793edfc1md570b73135cbe941@mail.gmail.com>
	(Roger Varley's message of "Fri\, 3 Apr 2009 14\:31\:20 +0300")
References: <39f1c8d30904030431m793edfc1md570b73135cbe941@mail.gmail.com>
Message-ID: <87wsa152ny.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roger" == Roger Varley <roger.varley@googlemail.com> writes:

 Roger> Hi
 Roger> I have installed buildroot-2902 and I'm trying my hand at my first
 Roger> "make" It fails when it tries to build u-boot-2009-01 with
 Roger> the error

 Roger> make[1] *** no rule to make target "vortex_config"

 Roger> I don't use u-boot, I've selected the grub option but the system won't
 Roger> allow me to switch off the "Das U-Boot Boot Monitor".
 Roger> How do I stop buildroot from trying to build U-Boot

Did you by any chance select the advanced Linux kernel config and
uImage as "kernel binary format"? If so, then that's why it tries to
build U-Boot. You probably want bzImage instead.

-- 
Bye, Peter Korsgaard
