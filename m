From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 04 Dec 2014 13:46:16 -0800
Subject: [Buildroot] [PATCH v4 00/14] Add Xorg support for iMX6
In-Reply-To: <2300509.9auvbGzPAa@sagittea>
References: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
 <2598910.830VmRFfsL@aquila> <5480B48A.8060705@gmail.com>
 <2300509.9auvbGzPAa@sagittea>
Message-ID: <5480D628.1070303@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerome, All,

On 12/04/2014 01:19 PM, J?r?me Pouiller wrote:
> [snip]
>>> Just in case it would be useful, you will find my .config here:
>>>      https://gist.github.com/jerome-pouiller/3c5a0c5c6f3a06cd5f75
>> Is it normal that your configuration is using the FB version of the
>> vivante libs? In my case I wanted to test everything at once (X11 libs &
>> Qt5). Have you tried with the X libs?
> It looks like you enabled EGLFS in Qt5. EGLFS need framebuffer version of gpu-
> viv-bin-mx6q. If you want to use X11, you have to enable xcb in qt5 (as in
> example in commit log of "07/14 xdriver_xf86-video-imx-viv").
>
> I do not see any simple generic solution to prevent user to choose EGLFS in Qt
> if X11 backend is selected in gpu-viv-bin-mx6q :-(
>
> You will find below configuration I use for X11:
>     https://gist.github.com/jerome-pouiller/a35bcd4a65a49d5683d1

That might be the case yes although I don't remember specifying EGLFS 
but I might have mixed up different configs. I'll try building the your 
config for X11 and let you know.

Thanks,
Gary
