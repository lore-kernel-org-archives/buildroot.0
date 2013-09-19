From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 06:12:33 +0200
Subject: [Buildroot] [PATCH] qt5base: fix build when egl headers need a
 definition
In-Reply-To: <523A1AE3.9090802@mind.be>
References: <1379503071-5446-1-git-send-email-fatih.asici@gmail.com>
 <20130918185539.00adb05c@skate> <523A1AE3.9090802@mind.be>
Message-ID: <20130919061233.35eb34e3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 18 Sep 2013 23:28:03 +0200, Arnout Vandecappelle wrote:

> >> >+++ b/package/qt5/qt5base/qt5base-egl-cflags.patch
> > All patches should have a description, and a Signed-off-by line. See
> > http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.
> 
>   Also, please give your patch a number so that the order in which 
> they're applied is predictable. At the moment this probably doesn't 
> matter much, but it makes it easier later on to make sure a new patch 
> will be applied after this one.

Yeah, I also wanted to ask that, but there are existing patches for
qt5base that doesn't comply with this, so I felt that it was maybe not
appropriate to ask a contributor to fix our (my ?) mess :-)

But indeed, Fatih, as a preparation patch, you could add number to the
existing patches, and then add your own.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
