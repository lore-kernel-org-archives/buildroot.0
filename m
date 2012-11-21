From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Wed, 21 Nov 2012 02:42:43 -0800 (PST)
Subject: [Buildroot] QtWebKit problem
In-Reply-To: <20121121105302.04d751ae@skate>
References: <1353490900.77327.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20121121105302.04d751ae@skate>
Message-ID: <1353494563.12720.YahooMailNeo@web164605.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

But before I start overall recompiling, which is (as you know) lengthy
process, is there maybe some dependencies, that I should check 
before (related to QtWebKit) ?
?
Regards? 

________________________________
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
Sent: Wednesday, November 21, 2012 10:53 AM
Subject: Re: [Buildroot] QtWebKit problem
  
Dear Zoran Djordjevic,

On Wed, 21 Nov 2012 01:41:40 -0800 (PST), Zoran Djordjevic wrote:
> I've built linux with Qt support, and later decided to add
> QtWebKit. I checked it, and rebuild (previously deleting
> stamp.build and stamp.install in ../output/build/qt-4.7.4)
> After building I didn't get QtWebKit in .../sysroot/usr/include.
> Where I go wrong ?

Don't do magic with stamp files, do:

??? make qt-reconfigure

Or preferably, a 'make clean all' cycle.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121121/ab049bb4/attachment.html>
