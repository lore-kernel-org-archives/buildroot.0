From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 22:04:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsidplay2: broken with gcc6
In-Reply-To: <B397AE0E-28F2-4D0D-866B-3FD929EFB1DC@gmail.com>
References: <1470771855-12987-1-git-send-email-bernd.kuhls@t-online.de>
 <B397AE0E-28F2-4D0D-866B-3FD929EFB1DC@gmail.com>
Message-ID: <20160809220419.36e61b43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Aug 2016 12:52:29 -0700, Khem Raj wrote:
> > On Aug 9, 2016, at 12:44 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> > 
> > Also propagate reverse dependency to kodi-audiodecoder-sidplay.
> > 
> > Fixes
> > http://autobuild.buildroot.net/results/4f5/4f57a7a37da0ce6d14a368272d982b4874a54927/  
> 
> This could also be fixed in code instead to statically typecast to int8_t.

I would also very much prefer to see the code being fixed, rather than
this weird !AT_LEAST_GCC_6 dependency being added.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
