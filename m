From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 11:21:12 +0200
Subject: [Buildroot] [PATCH] php: bump 7.0.11
In-Reply-To: <CANqewP2HZviH=vUGPu4JDrOKgpTjXx9BuVbO23PiM5u27+t5OA@mail.gmail.com>
References: <CANqewP0UNjM_Ya=awwHEC+H3+h8UH=DLFv9YoTihOw_sK4Ld9g@mail.gmail.com>
 <20160916184113.6fd787c1@free-electrons.com>
 <CANqewP2HZviH=vUGPu4JDrOKgpTjXx9BuVbO23PiM5u27+t5OA@mail.gmail.com>
Message-ID: <20160917112112.53a0e5cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 07:36:54 +0000, Tatsuyuki Ishi wrote:
> Thank you, the following is the updated patch.

Thanks. But this patch also cannot be applied, for two reasons:

 - The changelog part of the message such as "Thank you, the
   following..." should not be part of the commit log, but instead
   should be below the "---" so that it does not get integrated in the
   Git history when the patch is applied.

 - Since you haven't used git send-email, your patch is line-wrapped
   (i.e long lines are wrapped), so it cannot be applied.

Could you rework your patch to take into account those comments?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
