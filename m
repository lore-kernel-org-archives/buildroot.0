From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:33:12 +0200
Subject: [Buildroot] [PATCH 15/18] pkg-utils.mk: patch_sub_makefile
In-Reply-To: <20180912231548.537ced1b@windsurf>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-16-chrismcc@gmail.com>
 <20180912231548.537ced1b@windsurf>
Message-ID: <20180912233312.02cd4fa1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 23:15:48 +0200, Thomas Petazzoni wrote:

> I was wondering if there was really no way to pass these values through
> the environment.

This problem was reported at
https://rt.cpan.org/Public/Bug/Display.html?id=28632, and apparently
fixed in 2013, at least for the "LD" variable. Why are we still seeing
this issue ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
