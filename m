From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 7 Mar 2015 18:56:51 +0100
Subject: [Buildroot] [PATCH 3/3] uclibc: add patch fixing non-threaded
 build on Xtensa for uClibc-ng 1.0.0
In-Reply-To: <20150307173048.4652ee0c@free-electrons.com>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307144013.GE4186@free.fr>
 <20150307154325.GH3937@waldemar-brodkorb.de>
 <20150307173048.4652ee0c@free-electrons.com>
Message-ID: <20150307175651.GJ3937@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Sat, 7 Mar 2015 16:43:26 +0100, Waldemar Brodkorb wrote:
> 
> > May be then we get an extra package for uClibc-ng?
           ^^^^ 

> No, I'm still not convinced we need separate packages at this point.
> Maybe in the future if uClibc and uClibc-ng diverge significantly, but
> it's not the case right now.

To clear things up, I am happy with the version stuff and we don't
need an extra package. I just thought whenever we get the situation
that uClibc 1.0.0 is released _and_ uClibc-ng is still using 1.0.x
;)

best regards

        Waldemar

I shut up now.
