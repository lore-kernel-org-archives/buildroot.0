From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 31 Jul 2016 14:51:21 +0900
Subject: [Buildroot] [PATCH 6/7] zynq_zc706: bump U-Boot to
	xilinx-v2016.2
In-Reply-To: <20160730212603.18cf884d@free-electrons.com>
References: <1468834703-27518-1-git-send-email-yamada.masahiro@socionext.com>
 <1468834703-27518-7-git-send-email-yamada.masahiro@socionext.com>
 <CANQCQpaM__7tuCvn7=tm3xkxv7aG4Yi_to-YVD5QP0HN+R-7xQ@mail.gmail.com>
 <20160730181450.04333637@free-electrons.com>
 <CANQCQpamSTQickVBkpJc+gR_UpGKfWq5X3Myj_MzadPuQ6oiJw@mail.gmail.com>
 <20160730212603.18cf884d@free-electrons.com>
Message-ID: <CAK7LNAS+CB9VTGumGYg51xCLdvEZ0tP7bU+7XpJRrtXcttmBaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.



2016-07-31 4:26 GMT+09:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sat, 30 Jul 2016 14:05:16 -0500, Matthew Weber wrote:
>
>> I agree with regards to the default devkit setup, but any custom FPGA
>> development can affect the ps7_init file.  I'll submit a patch to provide
>> guidance for how to pull in the files and to define the situation that
>> requires those steps.
>
> OK, thanks!
>


Oh dear, I was about to send v2,
but looks like I was a little late.


As requested by Matthew, I wrote how to use custom ps7_init
based on the latest U-Boot.

Also, I noticed the U-Boot was still stuck to the legacy
config system, so made it switch to Kconfig.


I wish I could have sent it a bit earlier...
Anyway, I've just posted a follow-up one that can be
applied to the mainline.  Please check it out.




-- 
Best Regards
Masahiro Yamada
