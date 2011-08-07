From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 7 Aug 2011 23:04:25 +0200
Subject: [Buildroot] Adding libev to buildroot
In-Reply-To: <4E3E72BF.9040302@roth-itk.de>
References: <4E3E72BF.9040302@roth-itk.de>
Message-ID: <CAGm1_ktR=-TywrmxLORcmG3Hch1=RsqDusL9y+UmJKt6=gT30A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernhard,

On Sun, Aug 7, 2011 at 1:10 PM, Bernhard Roth <broth@roth-itk.de> wrote:
> Hello all,
>
> I am using buildroot for a while now and I always have to add the libev
> library for my projects. Libev is a lightweight and powerful alternative to
> livevent.
> Maybe it's possible to add libev support to the next official version of
> buildroot.
>
> Attached I send you the package config files for libev which I use (based on
> libevent files)
> Please put them into package/libev.
>
> Finally following line has to be added to package/Config.in just after
> libevent
>
> source "package/libev/Config.in"

Please send a proper patch using git or quilt and add your Signed-off-by string.

Yegor
