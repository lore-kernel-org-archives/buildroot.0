From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 12:04:59 +0200
Subject: [Buildroot] raspberry-pi3 do not work on buildroot-2016.05.
In-Reply-To: <af359c7d-b7cc-7887-bd76-a33d668b7090@beneth.fr>
References: <CAFN-Ez753CAapach8-OT+_HKb9zSQJORQ_imQdU+Z2y0OyRcvQ@mail.gmail.com>
 <20160810223555.5ca9d42f@free-electrons.com>
 <af359c7d-b7cc-7887-bd76-a33d668b7090@beneth.fr>
Message-ID: <20160818120459.4c59b71f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 10:32:05 +0200, Beno?t Mauduit wrote:

> I can run a test, but I need to change the toolchain GCC version to 6.x
> on the defconfig to make it work on 2016.05 on my dev laptop.
> 
> gcc-4.9.x and gcc-5.x do not compile anymore with my host gcc & g++
> (Version 6.1.1 on Debian Unstable). [1]

Are you sure? We have backported the relevant gcc fixes to make our gcc
4.9 and gcc 5 build on machines that use gcc 6 as their host compiler.
And now, gcc 4.9.4 has been released, which contains the fix to build
with gcc 6 (and we have upgraded to 4.9.4).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
