From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Aug 2010 11:30:56 +0200
Subject: [Buildroot] SDL instead of DirectFB
In-Reply-To: <4C76BE36.7040904@hab.desoft.cu>
References: <4C76BE36.7040904@hab.desoft.cu>
Message-ID: <20100829113056.1e212d5c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

On Thu, 26 Aug 2010 14:19:18 -0500
Daniel Lodos <daniel.lodos@hab.desoft.cu> wrote:

> I am trying to make a linux that supports java swings. Java requires
> X11 in linux for the graphics. I was trying to install DirectFB but
> there where a lot of errors. Can I use SDL instead of DirectFB for
> this purpose?

Typically, if you're using X11, DirectFB is not needed. Why would you
need both ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
