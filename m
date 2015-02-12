From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 12 Feb 2015 15:51:44 -0500
Subject: [Buildroot] [PATCH 1/1] Add default configuration for Raspberry
 Pi 2 (ARMv7 & NEON)
In-Reply-To: <20150212190940.GA4277@free.fr>
References: <20150211175219.22579465@hebden.net.au>
 <20150212190940.GA4277@free.fr>
Message-ID: <CA+-urNQusdwq8S_UeMLttY22+v8mzUrFQy4cYyOtzs3q7TOKRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann and James,

>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rpi-3.18.y-rebase"
>
> We can not use a branch name here. We want either a tag or a sha1.
> Currently, this is 0be82f722c097340632a59b879fbfee9c6148f53.

Regarding the Raspberry Pi kernel version, what's the difference
between using the tip of the rpi-3.18.y branch and the tip of the
rpi-3.18.y-rebase branch? The kernel source code looks the same
between branches except for some trailing whitespace in files. Is the
rpi-3.18.y branch safe from rebases?

Frank
