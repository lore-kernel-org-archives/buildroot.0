From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Nov 2012 11:52:06 +0100
Subject: [Buildroot] [PATCH 19/33] python2: bump to 2.7.3
In-Reply-To: <CAHXCMML2DTvu9uGzDe9pb+qQXhAAfDAEOsouacV50_r-+8rPLg@mail.gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-20-git-send-email-s.martin49@gmail.com>
 <20121122111612.4bfdeee2@skate>
 <CAHXCMML2DTvu9uGzDe9pb+qQXhAAfDAEOsouacV50_r-+8rPLg@mail.gmail.com>
Message-ID: <20121122115206.0759c7cb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 22 Nov 2012 11:47:21 +0100, Samuel Martin wrote:
> 2012/11/22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> > Dear Samuel Martin,
> >
> > On Thu, 22 Nov 2012 01:18:09 +0100, Samuel Martin wrote:
> >> Pyhton 2.7.3 includes several security fixes.
> >> See: http://www.python.org/download/releases/2.7.3/
> >>
> >> Also fixes the patch making sqlite optional.
> >>
> >> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> >> ---
> >>  package/python/python-2.7-009-python-symlink.patch | 25 -----------------
> >
> > Any reason for removing this one?
> Yes, fixed upstream in the 2.7.3 release :-)

Awesome, something fixed upstream in Python \o/ :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
