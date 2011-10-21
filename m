From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2011 15:58:26 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <CAGm1_kuP2sT=fXdvmnHWbC=B0ie4v4swZTbs9eKHGXVAT5FERA@mail.gmail.com>
References: <20111017184718.71afc290@skate> <20111021154303.43f98ccd@skate>
 <CAGm1_kuP2sT=fXdvmnHWbC=B0ie4v4swZTbs9eKHGXVAT5FERA@mail.gmail.com>
Message-ID: <20111021155826.061d9b8f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 21 Oct 2011 15:51:51 +0200,
Yegor Yefremov <yegorslists@googlemail.com> a ?crit :

> thanks for sharing this slides. I found some really useful issues I
> have never thought about before.

You're welcome. Nice to see it is useful.

> Page 23 (setting root password):
> 
> 1. what have you set?

The root password.

> 2. $TARGET_DIR is not working for me, but $1/etc/shadow is working

Fixed. I usually do TARGETDIR=$1 or TARGET_DIR=$1 at the beginning of
the script.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
