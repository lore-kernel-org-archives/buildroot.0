From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 8 May 2012 21:22:01 +0200
Subject: [Buildroot] [PATCH v3] BeagleBone: new board
In-Reply-To: <1336402801-15097-1-git-send-email-fhunleth@troodon-software.com>
References: <1336402801-15097-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <CAGm1_kt4SWwUuVH9DkB9TWB_qY3CKQ9DY9wdMczC8dWr2D1GNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

thanks for the patch. I now have a working kernel.

> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/koenkooi/linux.git"

What about using http instead of git? If I make it in the office the
whole LAN becomes totally lame and it is also good for proxy protected
environments.

One more issue having nothing to do with the patch itself. I cannot
compile it with the latest Linaro toolchain. it complains about not
having some assembly functions. With BR generated toolchain everything
is working as expected.

Yegor
