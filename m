From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 14:11:59 +0100
Subject: [Buildroot] [PATCH 14/34] qt5base: add GUI support
In-Reply-To: <CAKAx1chXW8jSsZcP66YxoSYSzdPvXtk3+eyq3UJCpvR21FDCVg@mail.gmail.com>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362601396-32250-15-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAKAx1chXW8jSsZcP66YxoSYSzdPvXtk3+eyq3UJCpvR21FDCVg@mail.gmail.com>
Message-ID: <20130307141159.126aaf1b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Thu, 7 Mar 2013 14:10:20 +0100, Lionel Orry wrote:

> > +QT5_BASE_CONFIGURE_OPTS += -no-xcb
> 
> typo here: should be
> 
> QT5BASE_CONFIGURE_OPTS += -no-xcb

Well spotted, thanks! I'm fixing this.

Thanks a lot for your review,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
