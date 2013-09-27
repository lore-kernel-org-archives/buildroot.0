From: Fatih =?UTF-8?Q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 27 Sep 2013 08:42:13 +0300
Subject: [Buildroot] [PATCH] beagleboneblack: add board
In-Reply-To: <CA+T6QPknCP3O2uM_S8va-MqY+jjzmojgmADw3wg4=4ePNmLw0A@mail.gmail.com>
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 <87bo3f5pz4.fsf@dell.be.48ers.dk>
 <OF4892FC0E.FA9FE3E3-ON86257BF2.006E10F1-86257BF2.006EC6A2@rockwellcollins.com>
 <CA+T6QPknCP3O2uM_S8va-MqY+jjzmojgmADw3wg4=4ePNmLw0A@mail.gmail.com>
Message-ID: <1380260533.22318.8.camel@viko>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2013-09-26 at 16:53 -0400, Jason Kridner wrote:
> > Would there be any issues with bumping the kernel version to this
> for
> > the original (white) beaglebone as well?
> 
> Nope. I could make one build that supported both boards, but it would
> need to have both .dtb files in it. That's the only reason I made a
> separate config. Is there an easy way to include multiple .dtb files?
> Mainline u-boot is smart enough to tell me which one needs to be used
> at boot.
> 
If the linux tree is common for beaglebone white and black, I think we
could use one board directory and separate buildroot defconfig's.
