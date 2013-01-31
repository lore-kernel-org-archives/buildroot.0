From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 31 Jan 2013 09:43:49 +0100
Subject: [Buildroot] Pandaboard ethernet
In-Reply-To: <510A2BC5.6000905@gmail.com>
References: <510A2BC5.6000905@gmail.com>
Message-ID: <CAGm1_kso1_L721ApeLnq2rhCGb5UQvr9cCp3ELS4qHFGBhJ90A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 31, 2013 at 9:31 AM, Gerald <gerald.radix@gmail.com> wrote:
> With Buildroot 2011.11.1, i use the  setting of pandaboard config, but i
> have no ethernet :
>
> ifconfig eth0 up :
> SIOCGIFFLAGS: No such device.
>
> What is the driver of ethernet pandaboard and how-to use it ?

Just activate CONFIG_USB_NET_SMSC95XX and then post output of ifconfig:

ifconfig -a

Yegor
