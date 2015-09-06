From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Sep 2015 13:49:01 +0200
Subject: [Buildroot] Buildroot kconfig option
In-Reply-To: <CAKpDV8sMNQH6hMaSSrgAeJM0GhAN0DiSKFn7dbkMagcdtMb9AQ@mail.gmail.com>
References: <CAKpDV8vL7GHk3cQ5Jk5o4G654KfQpQAfopsrA0Fotvu+vsaKMw@mail.gmail.com>
 <20150906091033.GC2213@tarshish>
 <CAKpDV8sMNQH6hMaSSrgAeJM0GhAN0DiSKFn7dbkMagcdtMb9AQ@mail.gmail.com>
Message-ID: <20150906134901.66a22482@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dinesh Guleria,

On Sun, 6 Sep 2015 17:07:42 +0530, Dinesh Guleria wrote:

> One more thing ,
> 
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG
> 
> This is environmental variable ?
> 
> If yes then , Do i have to export so many variables manually or buildroot
> support some file where i can mention these variables ?

All BR2_* variables are kconfig options, they are defined by running
"make menuconfig".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
