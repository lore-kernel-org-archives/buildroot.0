From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Dec 2012 22:28:09 +0100
Subject: [Buildroot] [Bug 5750] buildroot-2012.11 while building X11 for
 ARM, errors on  xlib_libX11-1.4.2
In-Reply-To: <87txs08adj.fsf@dell.be.48ers.dk>
References: <bug-5750-163@https.bugs.busybox.net/>
 <20121205075957.00AEA99A07@busybox.osuosl.org>
 <50BF826F.4060004@mind.be> <87txs08adj.fsf@dell.be.48ers.dk>
Message-ID: <20121205222809.28faea35@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 05 Dec 2012 13:19:52 -0800, Peter Korsgaard wrote:

>  >> For some complicated reason, using Buildroot in a directory stored
>  >> under /usr doesn't work. We will work on fixing that, but in the
>  >> mean time, please build from /home/something, /opt or anything
>  >> else, but not from a subdirectory of /usr.
> 
>  Arnout>  We should at least have a check for that...
> 
> Indeed. I'm looking into adding one.

Well, I think we should rather fix the problem. I have a fix that works
for most cases, except for the stupid libglib2 package that generates
incorrect .la files...

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
