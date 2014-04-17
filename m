From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 12:01:56 +0200
Subject: [Buildroot] buildroot file system: Kernel panic
In-Reply-To: <CABzetm1Ht=SonZ8-6TYtAA3h+Z+Jv-PdeFOuvJoZ89EUgBtqCQ@mail.gmail.com>
References: <CABzetm2iM9vUAQ4GHfiKv_y3HCq_Jek45Pe16MPSZo=CoV+6Cw@mail.gmail.com>
 <20140416091611.03ce43f3@skate>
 <CABzetm3snhCBbvvtZ8Z9btySm0BeRsf2gwG2GxhNn0mXy4d1fA@mail.gmail.com>
 <20140416095711.430764d9@skate>
 <CABzetm2VtaC-B4tv+2N9qpD-1anG7FkcgGnbV+fcimRCnCLzFQ@mail.gmail.com>
 <20140416103924.64cdc49f@skate>
 <CABzetm27cTYk_wiu1Skt3dkbvpFioaCQVz+YaE=VWjXKCz4eUw@mail.gmail.com>
 <CABzetm1Ht=SonZ8-6TYtAA3h+Z+Jv-PdeFOuvJoZ89EUgBtqCQ@mail.gmail.com>
Message-ID: <20140417120156.2ee23368@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Thu, 17 Apr 2014 16:59:03 +0900, Rohit Kumar wrote:

> out of all this i figured out that file system works with cpu
> subarchitecture of "armv6j" and not "armv6zk" which is ARM1176jzf-s

Now that you have a booting system, can you show the output of
"cat /proc/cpuinfo" ? It will help understand exactly which variant of
ARM core your processor is using.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
