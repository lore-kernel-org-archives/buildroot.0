From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Apr 2019 08:56:53 +0200
Subject: [Buildroot] Reg: Valgrind support for Aarch64 in buildroot
 2019.02.02
In-Reply-To: <CAAMHf5EaMVDS23JXv-4_yWByHnn=0xT+iOKdVOhan5Ah4EvbLw@mail.gmail.com>
References: <CAAMHf5EaMVDS23JXv-4_yWByHnn=0xT+iOKdVOhan5Ah4EvbLw@mail.gmail.com>
Message-ID: <20190430085653.0bd4914e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Apr 2019 11:45:17 +0530
ravi chandran <ravigct27@gmail.com> wrote:

>    Is valgrind support for aarch64 platform is available in buildroot
> version 2019.02.02?

config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
        bool
        default y if BR2_aarch64

So, yes, Valgrind can be enabled on AArch64 in Buildroot 2019.02.

Why do you ask this question ? Did you try and encountered an issue ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
