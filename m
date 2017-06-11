From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:07:09 +0200
Subject: [Buildroot] [PATCH v3 11/11] python-ipython: bump to version
 5.4.0
In-Reply-To: <CAGm1_kt8nV+XcG_55STn0xyHG+vNFk=OkSUDXf3VYnXAPZmHDQ@mail.gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-12-andrew.smirnov@gmail.com>
 <CAGm1_kt8nV+XcG_55STn0xyHG+vNFk=OkSUDXf3VYnXAPZmHDQ@mail.gmail.com>
Message-ID: <20170611150709.170456dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Jun 2017 21:40:56 +0200, Yegor Yefremov wrote:
> On Sat, Jun 3, 2017 at 1:56 AM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>  
> 
> you could squash this patch and the one with updated dependency list

It depends. Is PATCH 10/11 (adding the dependencies) only needed for
iPython 5.4.0, or also needed for the existing iPython 5.2.2. I think I
remember having tested iPython 5.2.2, and those runtime dependencies
were already necessary.

If the runtime dependencies are already needed for iPython 5.2.2, then
the patches should be kept separated.

If the runtime dependencies are only needed because of the bump to
5.4.0, then patches should indeed been squashed together.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
