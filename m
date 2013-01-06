From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Jan 2013 13:39:08 +0100
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <20130106083433.GH13545@sapphire.tkos.co.il>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
 <50E6E757.10809@zacarias.com.ar>
 <50E6EDB5.9070004@petroprogram.com>
 <20130106054113.GD13545@sapphire.tkos.co.il>
 <CAHXCMM+fy_WvvDgQfYTcyoiHAaSvbPuLv8P5p9em_=RRHMQ8rQ@mail.gmail.com>
 <20130106083433.GH13545@sapphire.tkos.co.il>
Message-ID: <20130106133908.6223837b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 6 Jan 2013 10:34:35 +0200, Baruch Siach wrote:

> So is local build directories in RPATH currently a fact of life? If so can my 
> wireshark package (linked above) be merged as is? Peter?

We currently have packages that carry on the target a RPATH to the
build directory. It is not nice, but harmless since it is highly
unlikely that this path is going to exist on the target.

Therefore, I wouldn't say that having the build directory as a RPATH in
the final binary is a show-stopper to get the package included.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
