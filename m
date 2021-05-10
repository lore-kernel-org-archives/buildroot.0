From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Mon, 10 May 2021 15:54:07 +0200
Subject: [Buildroot] Build failure on acmesystems_acqua_a5_{256,512}mb
In-Reply-To: <87r1ieybzy.fsf@tarshish>
References: <6347f09d-5329-865a-f77d-92332050495d@grenoble.cnrs.fr>
 <87r1ieybzy.fsf@tarshish>
Message-ID: <f6dfc9ab-2301-5f48-2f16-bd18ca4dc37a@grenoble.cnrs.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Baruch wrote:
> These configs select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL which adds
> host-openssl to LINUX_DEPENDENCIES. See linux/linux.mk.

Thank-you for our help! I really missed that one. I am doing a test
build here with this extra option and, if all goes well, I'll submit a
patch.

Regards,

Edgar Bonet.
