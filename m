From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2010 11:43:04 +0100
Subject: [Buildroot] Best way to run ntpdate at startup
In-Reply-To: <368044.7338.qm@web44815.mail.sp1.yahoo.com>
References: <368044.7338.qm@web44815.mail.sp1.yahoo.com>
Message-ID: <20100214114304.4d4f7eeb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
