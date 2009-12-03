From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Thu, 3 Dec 2009 10:53:52 -0500
Subject: [Buildroot] Problems connecting to AT91SAM9260
In-Reply-To: <20091203154314.237790@gmx.net>
References: <20091203154314.237790@gmx.net>
Message-ID: <375C306A47E34D4B9E59016A0E7ACFC6@cimeq.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot-bounces at busybox.net wrote:
> I want to connect to the ARM board mentioned in the subject with
> minicom. 
> So I connected the board with the RS232 interface and the USB_D
> interface to my host PC and configured minicom with the following 
> parameters:
> 115200, 8bits, 1stop, no parity, no flow Then I powered up the board.
> It started sending some datas to minicom about the boot process. Then
> it ended up with the lines: Uncompressing Linux...RomBOOT 
>> RomBOOT
> 
AT91sam ml or AT91.com should be better for that support.

Jonathan
> 
> Best regards
> 
> Jens Kleinhans
> --
> Sarah Kreuz, die DSDS-Siegerin der Herzen, mit ihrem eindrucksvollen
> Deb?talbum "One Moment in Time". http://portal.gmx.net/de/go/musik
> _______________________________________________ 
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
