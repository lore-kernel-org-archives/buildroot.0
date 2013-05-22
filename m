From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 13:51:32 +0200
Subject: [Buildroot] Does buildroot toolchain support GNU EABI?
In-Reply-To: <CAGm1_kt83BK9b4vQqZpH+mjArK6SmbhdruUUEn4TSAUcS2JXXg@mail.gmail.com>
References: <20130522092041.GA15526@zuhnb712.ap.bm.net>
 <CAGm1_kt83BK9b4vQqZpH+mjArK6SmbhdruUUEn4TSAUcS2JXXg@mail.gmail.com>
Message-ID: <20130522135132.09bee9dc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Wed, 22 May 2013 11:33:56 +0200, Yegor Yefremov wrote:

> BR toolchains are always EABI unless you specify it to generate OABI
> binaries. See Wikipaedia for EABI info:
> http://en.wikipedia.org/wiki/EABI#EABI

The support for OABI has been deprecated in Buildroot since
c4cfa85b798cb744954d35aa05fa41e7a6956abd. I even believe it has been
deprecated or maybe removed from the latest version of gcc.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
