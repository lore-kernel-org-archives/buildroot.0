From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sun, 14 Feb 2010 13:17:33 -0800 (PST)
Subject: [Buildroot] Best way to run ntpdate at startup
In-Reply-To: <20100214114304.4d4f7eeb@surf>
References: <368044.7338.qm@web44815.mail.sp1.yahoo.com>
	<20100214114304.4d4f7eeb@surf>
Message-ID: <887347.74107.qm@web44806.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The ntpd script reads /etc/default/ntpd, in which you can set NTPDATE,
> NTPD and other variables.

Perfect solution.  Thanks.



________________________________
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: buildroot at busybox.net
Sent: Sun, February 14, 2010 4:43:04 AM
Subject: Re: [Buildroot] Best way to run ntpdate at startup

Hello Jim,

On Sat, 13 Feb 2010 22:27:11 -0800 (PST)
Jim Thomas <jimthomasembedded@yahoo.com> wrote:

> Where should I configure NTPDATE=yes and NTPSERVERS=0.us.pool.ntp.org?
> 
> I could add this to the top of S49ntp, but is there some other
> startup config file that is intended for such options so S49ntp
> remains unaltered?
> 
> Is this done manually, or through Buildroot 'make menuconfig'?

The ntpd script reads /etc/default/ntpd, in which you can set NTPDATE,
NTPD and other variables.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100214/0a1129d1/attachment.htm>
