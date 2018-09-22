From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 18:53:19 +0200
Subject: [Buildroot] [PATCH 1/1] python-django: bump version to 2.1.1
In-Reply-To: <CALFsTFW2-B2wjeJ6Fmv=wUWPNOUGQgPhHE8ZV-zSA+FojgznDw@mail.gmail.com>
References: <20180921150825.1986-1-aduskett@gmail.com>
 <CALFsTFW2-B2wjeJ6Fmv=wUWPNOUGQgPhHE8ZV-zSA+FojgznDw@mail.gmail.com>
Message-ID: <20180922185319.6b7538b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 18:32:51 +0300, Asaf Kahlon wrote:

> I don't use django regularly, but it seems django needs pytz (
> https://github.com/django/django/blob/2.1.1/setup.py).
> Moreover, django has dropped support in python2 since 2.0 (
> https://docs.djangoproject.com/en/dev/faq/install/#what-python-version-can-i-use-with-django),
> so I guess the definition in Config.in should be changed to depend
> on BR2_PACKAGE_PYTHON3.

Thanks Asaf for this review, much appreciated.

Adam: I have marked your patch as Changes Requested in patchwork. Could
you send an updated version that takes into account the comments made
by Asaf ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
