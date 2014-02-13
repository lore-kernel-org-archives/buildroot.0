From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 10:30:56 +0100
Subject: [Buildroot] [PATCH] host python/python3: conditionally disable
 unicodedata
In-Reply-To: <CAAXf6LXfA8rir0O_49wy6Y5ur55k_U7P=88OsJB3JsVTwUzYPA@mail.gmail.com>
References: <e06b104c5f166c541741.1391768165@argentina>
 <20140207112819.2fab19a3@skate>
 <CAAXf6LXfA8rir0O_49wy6Y5ur55k_U7P=88OsJB3JsVTwUzYPA@mail.gmail.com>
Message-ID: <20140213103056.3ad2c056@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 13 Feb 2014 10:15:14 +0100, Thomas De Schampheleire wrote:

> >> would cause the byte-compilation to fail with message:
> >>     SyntaxError: ("(unicode error) \\N escapes not supported (can't load
> >>     unicodedata module)",
> >>
> >> Instead, conditionally disable unicodedata based on
> >> BR2_PACKAGE_PYTHON_UNICODEDATA, also for the host python.
> >>
> >> This fixes bug #6542 (https://bugs.busybox.net/show_bug.cgi?id=6542)
> >>
> >> Reported-by: Gernot Vormayr <gvormayr@gmail.com>
> >> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> >
> > For information, my upcoming patch series that bumps Python uses
> > --enable-unicodedata unconditionally for the host python, because
> > recent versions of python-setuptools need unicodedata.
> >
> 
> I think this patch should still be part of 2014.02.

I agree.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
