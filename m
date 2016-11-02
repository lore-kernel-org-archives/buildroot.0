From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 23:15:34 +0100
Subject: [Buildroot] [PATCH v4 0/4] Update LTTng packages to 2.8.x and
 Babeltrace to 1.4.0
In-Reply-To: <20161102230852.3784bbdb@free-electrons.com>
References: <20161102065508.3162-1-eeppeliteloop@gmail.com>
 <20161102230852.3784bbdb@free-electrons.com>
Message-ID: <20161102231534.235a45c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Nov 2016 23:08:52 +0100, Thomas Petazzoni wrote:

> On Wed,  2 Nov 2016 02:55:04 -0400, Philippe Proulx wrote:
> > See if this is okay and I will rename lttng-babeltrace to babeltrace
> > again and submit this last patch.
> > 
> > Philippe Proulx (4):
> >   lttng-tools: bump to version 2.8.2
> >   lttng-babeltrace: bump to version 1.4.0
> >   lttng-babeltrace: add host Babeltrace as host utility
> >   lttng-babeltrace: add debug info support  
> 
> I've applied all patches, with some changes to the last patch. I'll
> reply to this one separately.

BTW, would you mind adding yourself to the DEVELOPERS file for the
lttng related packages? I'm currently listed as the person taking care
of them since I initially introduced those packages, but I'm not
actively using LTTng, so it would be better if someone else was listed
for those packages.

Being listed as a developer means that:

 1/ You will be Cc'ed on patches submitted by others that touch those
    packages

 2/ You will receive a notification when there are build issues related
    to those packages.

If you agree, please remove me as the developer for those packages, in
the same patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
