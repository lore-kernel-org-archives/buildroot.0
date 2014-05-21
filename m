From: Pierre Ficheux <pierre.ficheux@openwide.fr>
Date: Wed, 21 May 2014 14:05:31 +0200 (CEST)
Subject: [Buildroot] RPi
In-Reply-To: <123137298.15041034.1400673767940.JavaMail.root@openwide.fr>
Message-ID: <1826939078.15041392.1400673931165.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi BR people,

I did some work on BR around Raspberry Pi platform:

- adding a post-image script for RP SD-card image generation (adapted from Yocto RPi recipe)
- adding BR support for Adafruit touchscreen -> https://www.adafruit.com/products/1601

I don't know if it could help, but I can build patches.

Regards

-- 
Pierre FICHEUX -/- CTO OW/OWI, France -\- pierre.ficheux at openwide.fr
                                         http://ingenierie.openwide.fr
                                         http://www.linuxembedded.fr
I would love to change the world, but they won't give me the source code
