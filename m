From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Jan 2016 19:13:22 +0100
Subject: [Buildroot] [PATCH 1/1] lxc needs gzip scripts for
 lxc-checkconfig runtime
In-Reply-To: <alpine.DEB.2.11.1601110802480.13943@tanhuma.tkos.co.il>
References: <1442761327-18830-1-git-send-email-yba@tkos.co.il>
 <20150920190622.3f7278c3@free-electrons.com>
 <alpine.DEB.2.02.1509202012390.13941@orcam81.orcam.lan>
 <20150920230136.513b491c@free-electrons.com>
 <20160110170922.GH3460@free.fr>
 <alpine.DEB.2.11.1601110802480.13943@tanhuma.tkos.co.il>
Message-ID: <20160111181321.GB4257@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan, All,

On 2016-01-11 08:32 +0200, Jonathan Ben Avraham spake thusly:
> My current use case for lxc in Buildroot is for mobile SoC's such as the
> Qualcomm Snapdragon 805 and 810 that have IP blocks such as DSP's, VPU's and
> GPU's for which Qualcomm only releases Android drivers and libraries. In
> order to use these IP blocks, I run Android in an lxc and pass CNN kernels
> from Linux to adsprpcd running in Android that passes the CNN kernels
> through the Linux kernel to the Hexagon DSP. Admittedly this adds new
> meaning to the term "Convoluted Neural Networks"

Aha! :-)

> but it provides an interim
> solution to the application developers until we can reverse engineer
> Qualcomm's FastRPC interface.

Yeah, I can see how containers can come handy in this situation (not
unlike somethig I've had too, btw).

> I will re-spin the patch but before that I have yp-tools, ypbind-mt,
> sphinxbase and pocketsphinx to finish.

Great, thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
