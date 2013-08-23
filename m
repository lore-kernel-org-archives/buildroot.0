From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 06:59:36 +0200
Subject: [Buildroot] [PATCH 1/1] gcc: fix libstdc++_pic for AVR32
In-Reply-To: <1376025370-9467-1-git-send-email-alexander.lukichev@gmail.com>
References: <1376025370-9467-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <20130823065936.18a7d3e0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Lukichev,

On Fri,  9 Aug 2013 08:16:10 +0300, Alexander Lukichev wrote:
> It is not clear why 300-libstdc++-pic.patch pre-applied to
> gcc-4.2.2-avr32-2.1.5 seems to have come from some older version
> of gcc (as early as 4.0.3). This older patch incorrectly refers to
> object files to be included in the library libstdc++_pic.a as *.o,
> while their location seems to be in .libs/*.o (see the contents at
> e.g. https://github.com/ZigFisher/Midge/blob/master/toolchain/gcc/4.0.3/300-libstdc%2B%2B-pic.patch ).
> The same patch for gcc 4.1.0 refers to the files as .libs/*.o (see
> https://github.com/ZigFisher/Midge/blob/master/toolchain/gcc/4.1.0/300-libstdc%2B%2B-pic.patch ).
> This patch corrects rules in Makefile.in.
> 
> Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
