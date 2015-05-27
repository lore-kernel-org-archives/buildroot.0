From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 May 2015 10:13:33 +0200
Subject: [Buildroot] sky2 not created
In-Reply-To: <CAJtzDg9LiZjeTJcRXp=Eng8kfynfDjdYrtKD=kVJ=GJjuGobWg@mail.gmail.com>
References: <CAJtzDg-NoVNk_W8CnV0y0sY+dhZNCKTu66tfePnyUoDNj+bTeg@mail.gmail.com>
 <20150527094643.0dcb2107@free-electrons.com>
 <CAJtzDg9LiZjeTJcRXp=Eng8kfynfDjdYrtKD=kVJ=GJjuGobWg@mail.gmail.com>
Message-ID: <20150527101333.1c2f6137@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Laurent Joli,

On Wed, 27 May 2015 09:58:16 +0200, Laurent Joli wrote:

> First of all, Thank you for your answer.
> 
> I would like create *a sky2.ko as a module.*
> 
> I use buildroot-2015.05-rc3 and do what you say :
> 
> make qmx6_defconfig
>         make linux-menuconfig
>         ... select the sky2 driver ...
> make

Please show the result of:

grep SKY2 output/build/linux-3.10.17/.config

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
