From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 20:58:51 +0200
Subject: [Buildroot] pppd breaks build without libutils
In-Reply-To: <CAOoxthNVzy2PCz1tsACpxdhaoVO=RZgQR-A1dMB2u0HA3yXPqA@mail.gmail.com>
References: <CAOoxthNVzy2PCz1tsACpxdhaoVO=RZgQR-A1dMB2u0HA3yXPqA@mail.gmail.com>
Message-ID: <20160925205851.18f334ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Sep 2016 13:53:05 -0300, Cassiano Martin wrote:

> I am generating a small firmware environment, and pppd breaks build process
> if libutils is not included. I looked under its sources and its used to
> wtmp logging.

Thanks for this report. Could you be more specific in terms of the
Buildroot version that you're using, and the Buildroot configuration?
What exact build issue are you facing (i.e can you copy/paste the error
messages) ?

Indeed, we have autobuilders that test random configurations, and pppd
is built many times, and we haven't seen such an issue so far I believe.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
