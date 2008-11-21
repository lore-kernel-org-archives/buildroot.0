From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 21 Nov 2008 11:54:08 +0100
Subject: [Buildroot] No rule to make target uImage
In-Reply-To: <1133111752.1227264334.189979624.2801@mcgi56.rambler.ru>
References: <1133111752.1227264334.189979624.2801@mcgi56.rambler.ru>
Message-ID: <20081121105408.GC19111@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 21, 2008 at 01:45:34PM +0300, ?????? ?????? wrote:
>Hi.

Hi.. Please do not send duplicate messages to the list. TIA.

>make[1]: *** No rule to make target `uImage'. Stop.
>make: ***
>[/mnt/local_storage/buildroot/project_build_mipsel/uclibc/linux-2.6.22/uImage]
>Error 2
>
>==================================================================================
>
>Why NO_RULE_TO_MAKE _TARGET_UIMAGE ?

I suppose you mean
Why "No rule to make target XYZ"
Well, please read the helptext of BR2_PACKAGE_LINUX_FORMAT
HTH,
