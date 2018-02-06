From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Tue, 6 Feb 2018 08:49:01 -0600
Subject: [Buildroot] [PATCH 4/4] configs: add linux boot logo to
 raspberrypi3 defconfig
In-Reply-To: <1505819034-29610-5-git-send-email-angelo.compagnucci@gmail.com>
References: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
 <1505819034-29610-5-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <CAKGmAFrqsZZ=J4dbvSjjPKT1wU-J-p3Tra-m5t8cOGv4KkNmEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo / All,

> +BR2_LINUX_KERNEL_CUSTOMLOGO=y
> +BR2_LINUX_KERNEL_CUSTOMLOGO_PATH="docs/images/logo_linux_clut224.ppm"

Others may disagree, but I'm not sure if we really want the logo by
default on the pi3.

-- 


Bryce Ferguson
Software Engineer
Airborne Information Solutions \ RC Linux Platform

400 Collins Rd NE Cedar Rapids, Iowa 52498

Bryce.Ferguson at rockwellcollins.com
