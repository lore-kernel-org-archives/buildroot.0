From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 23:40:24 +0200
Subject: [Buildroot] [PATCH] pppd: Move netinet/in.h above linux header
 includes
In-Reply-To: <20161020232339.54683f92@free-electrons.com>
References: <1476997957-27184-1-git-send-email-Stefan.Nickl@gmail.com>
 <20161020232339.54683f92@free-electrons.com>
Message-ID: <20161020234024.4449a223@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Oct 2016 23:23:39 +0200, Thomas Petazzoni wrote:

> Thanks for your contribution! However, exactly 15 minutes before you
> sent this patch, I committed a change for the same problem:
> https://git.buildroot.org/buildroot/commit/?id=035567b2793f3649e2ddc6cd34b75dd643f47d73.

And in the end, my patch solved the build with recent kernel headers
(4.8), but broke the build with older kernel headers (like 3.10). So
Stefan, I've taken your patch and applied it in replacement to mine,
after testing that it makes the build break with both 4.8 and 3.10
kernel headers.

Thanks for your contribution, and sorry for the initial dismissal of
your patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
