From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 20:11:36 +0200
Subject: [Buildroot] genimage raw partition from multiple files
In-Reply-To: <5eba6e0b-68e0-db07-f0d7-d5be0580e257@gmail.com>
References: <cadb0fad-d46f-554c-05ee-ba70d0db7af1@gmail.com>
 <67c75046-efbc-0881-e7c1-656b11168102@gmail.com>
 <20170802195518.2f279e2b@windsurf.home>
 <5eba6e0b-68e0-db07-f0d7-d5be0580e257@gmail.com>
Message-ID: <20170802201136.08c38588@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Aug 2017 20:09:01 +0200, Micha? ?yszczek wrote:

> > And those two snippets of genimage configuration can be in a single
> > genimage.cfg, and both uboot.img and then sdcard.img will be produced
> > by a single genimage invocation ? Or do we need a first genimage
> > invocation to generate uboot.img, and then a second genimage invocation
> > to generate sdcard.img (which requires uboot.img) ?
> 
> Only one invocation of genimage.sh is needed to generate working
> sdcard.img. Yes! It's that simple! I attach full genimage.cfg I created
> for my port for cyclone5. This genimage.cfg creates fully working
> sdcard.img (including uboot.img), and only external script used is
> support/script/genimage.sh -c genimage.cfg.

Excellent! So I guess you can send a new version of your patch!

Also, don't hesitate to contribute to genimage to improve its
documentation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
