From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 17:30:48 +0100
Subject: [Buildroot] [PATCH 3/3] uclibc: add patch fixing non-threaded
 build on Xtensa for uClibc-ng 1.0.0
In-Reply-To: <20150307154325.GH3937@waldemar-brodkorb.de>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307144013.GE4186@free.fr>
 <20150307154325.GH3937@waldemar-brodkorb.de>
Message-ID: <20150307173048.4652ee0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sat, 7 Mar 2015 16:43:26 +0100, Waldemar Brodkorb wrote:

> May be then we get an extra package for uClibc-ng?

No, I'm still not convinced we need separate packages at this point.
Maybe in the future if uClibc and uClibc-ng diverge significantly, but
it's not the case right now.

> Bernhard is planning 0.9.34 release, so it is more a theoretically
> problem. I am sure uClibc-ng 1.1 is out before uClibc tags 1.0.0.

I'll wait for real acts from Bernhard before presuming that something
will happen in uClibc land. It may very well that we'll get rid of
uClibc support entirely in favor of uClibc-ng before Bernhard gets to
doing a new release for uClibc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
