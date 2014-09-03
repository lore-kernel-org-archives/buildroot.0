From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 03 Sep 2014 21:10:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-01
References: <20140902063012.275961012A9@stock.ovh.net>
Message-ID: <XnsA39DD76F66933berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140902063012.275961012A9 at stock.ovh.net: 

>     x86_64 |                     fltk-1.3.2 | NOK |
>     http://autobuild.buildroot.net/results/c35df0b20e9f65154e7cf3dfec01a6
>     35a071eb41/ 

Hi Thomas,

> Linking fluid...
> /home/test/autobuild/instance-3/output/host/usr/x86_64-buildroot-linux-
gnu/sysroot/usr/lib64/libxcb-shm.so.0: undefined reference to 
`xcb_get_reply_fds'
> /home/test/autobuild/instance-3/output/host/usr/x86_64-buildroot-linux-
gnu/sysroot/usr/lib64/libxcb-render.so.0: undefined reference to 
`xcb_str_sizeof'
> /home/test/autobuild/instance-3/output/host/usr/x86_64-buildroot-linux-
gnu/sysroot/usr/lib64/libxcb-shm.so.0: undefined reference to `xcb_send_fd'

I tried several times to reproduce this bug but failed.
Interestingly the bug only occurs on your build server:
http://autobuild.buildroot.net/?reason=fltk-1.3.2

Are there any xcb packages installed on your build server?

Regards, Bernd
