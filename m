From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 25 Jul 2015 22:02:13 +0200
Subject: [Buildroot] qt5base build issue
In-Reply-To: <55B3B794.3080706@jcz.nl>
References: <CAGm1_kumsLYH8RmBn3WWr64_yN1mjhc5DGhiZfpqCSdc3jvPtQ@mail.gmail.com>
 <55B0FEED.4070700@ecagroup.com>
 <CAGm1_kv_JrjpKVJ50_APpNsfP1knqxkNcr8bN0bSacvxVsjq7A@mail.gmail.com>
 <CAGm1_ku+MGyBs_CkXtAjZVgqCkmNAPJ8mjW6yc05unKzyQRDhA@mail.gmail.com>
 <55B1FA0C.6000809@ecagroup.com>
 <CAGm1_kujy48mMmd4QMSJL+zbEXf3ooRWN8mKd+WF6e5Dg3LeQA@mail.gmail.com>
 <55B210AF.8010004@ecagroup.com> <55B3B794.3080706@jcz.nl>
Message-ID: <CAGm1_kuOuWD54_EaA0_2odvFJ9sUJ3HBbwR9Thm8a9cWb-rspQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jaap,

On Sat, Jul 25, 2015 at 6:21 PM, Jaap Crezee <jaap@jcz.nl> wrote:
> On 07/24/15 12:17, Julien CORJON wrote:
>>>>>>>> During compilation I get following error:
>>>>>>>>
>>>>>>>> Running configuration tests...
>>>>>>>> Failed to process makespec for platform 'devices/linux-buildroot-g++'
>>>>>>>> Project ERROR: Compiler
>>>>>>>> /home/user/MyProjects/oss/buildroot/prods1/host/usr/bin/ccache
>>>>>>>> /home/user/MyProjects/oss/buildroot/prods1/host/usr/bin/arm-none-linux-gnueabi-g++
>>>>>>>> not found. Check the value of CROSS_COMPILE -device-option
>>>>>>>> Could not read qmake configuration file
>>>>>>>> /home/user/MyProjects/oss/buildroot/prods1/build/qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf.
>
> <snip>
>
> Dear all,
>
> Please see attached patch. It fixes this build issue for me.

Works for me too. Thanks.

Please resend this patch via git send-mail. You can add my "Tested-by:
Yegor Yefremov <yegorslists@googlemail.com>".

Btw have you already filed a bug request by Qt?

Yegor
