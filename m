From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 08:35:51 +0100
Subject: [Buildroot] [PATCH 3/3] uclibc: add patch fixing non-threaded
 build on Xtensa for uClibc-ng 1.0.0
In-Reply-To: <20150307175651.GJ3937@waldemar-brodkorb.de>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307144013.GE4186@free.fr>
 <20150307154325.GH3937@waldemar-brodkorb.de>
 <20150307173048.4652ee0c@free-electrons.com>
 <20150307175651.GJ3937@waldemar-brodkorb.de>
Message-ID: <20150308083551.4e3409fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sat, 7 Mar 2015 18:56:51 +0100, Waldemar Brodkorb wrote:

> > No, I'm still not convinced we need separate packages at this point.
> > Maybe in the future if uClibc and uClibc-ng diverge significantly, but
> > it's not the case right now.
> 
> To clear things up, I am happy with the version stuff and we don't
> need an extra package. I just thought whenever we get the situation
> that uClibc 1.0.0 is released _and_ uClibc-ng is still using 1.0.x
> ;)

Ah, yes indeed. If/when this situation arises, having separate packages
would be a solution.

Again, I guess it's too early to really draw a plan about what will
happen between uClibc and uClibc-ng. It really all depends on how both
projects will be maintained: if you continue to be active on uClibc-ng
or not, if the original uClibc project moves again or not, etc. So
let's not make too much plans, and see what happens :-)

However, one plan I'd like to make is to make uClibc-ng the default
uClibc version. Maybe for 2015.05, if not for 2015.08.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
