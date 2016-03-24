From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 10:52:36 +0100
Subject: [Buildroot] [PATCH 4/4] board/atmel/xplained/readme.txt: update
 documentation
In-Reply-To: <20160324094006.GF12245@odux.rfo.atmel.com>
References: <1458808152-15778-1-git-send-email-ludovic.desroches@atmel.com>
 <1458808152-15778-4-git-send-email-ludovic.desroches@atmel.com>
 <20160324094436.128dbd74@free-electrons.com>
 <20160324094006.GF12245@odux.rfo.atmel.com>
Message-ID: <20160324105236.374afb3b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 10:40:06 +0100, Ludovic Desroches wrote:

> > Another possible (but future, and unrelated) improvement is to use
> > genimage to generate a ready-to-use SD card image, which automatically
> > contains the VFAT and ext4 partitions.
> 
> We have some scripts which do this but at the moment I am not sure they
> can handle all possible errors. For sure, it will be great if we can
> achieve it in the future.

There's no real need for a script, genimage does most of the work. Look
at board/acmesystems/arietta-g25/genimage.cfg and
board/acmesystems/arietta-g25/post-image.sh, which are doing this for
an Atmel based platform.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
