From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 24 Mar 2016 10:40:06 +0100
Subject: [Buildroot] [PATCH 4/4] board/atmel/xplained/readme.txt: update
 documentation
In-Reply-To: <20160324094436.128dbd74@free-electrons.com>
References: <1458808152-15778-1-git-send-email-ludovic.desroches@atmel.com>
 <1458808152-15778-4-git-send-email-ludovic.desroches@atmel.com>
 <20160324094436.128dbd74@free-electrons.com>
Message-ID: <20160324094006.GF12245@odux.rfo.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Mar 24, 2016 at 09:44:36AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 24 Mar 2016 09:29:12 +0100, Ludovic Desroches wrote:
> > This documentation is not only dedicated to SAMA5D3 Xplained boards. The
> > procedure is the same for SAMA5D4 and SAMA5D2.
> > sfdisk, -u (--unit) option is obsolete on latest versions.
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> > ---
> >  board/atmel/xplained/readme.txt | 23 ++++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> There is some duplication of information between board/atmel/readme.txt
> (which also covers SAMA5 Xplained platforms) and
> board/atmel/xplained/readme.txt.
> 

I agree.

> Perhaps board/atmel/xplained/readme.txt should be removed entirely, and
> board/atmel/readme.txt contain all the information?
> 
> Seems like board/atmel/readme.txt covers how to flash on NAND, while
> board/atmel/xplained/readme.txt covers how to use a SD card based
> booting. Definitely not very clear when looking at the readme.txt
> location.
> 

I will try to do a quick merge.

> Another possible (but future, and unrelated) improvement is to use
> genimage to generate a ready-to-use SD card image, which automatically
> contains the VFAT and ext4 partitions.
> 

We have some scripts which do this but at the moment I am not sure they
can handle all possible errors. For sure, it will be great if we can
achieve it in the future.

Regards

Ludovic
