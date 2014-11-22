From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Nov 2014 12:10:33 +0100
Subject: [Buildroot] Analysis of build results
References: <20141111073014.AA83D101626@stock.ovh.net>
 <20141111234919.3178e9d3@free-electrons.com>
Message-ID: <XnsA3ED7BDB87A67berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20141111234919.3178e9d3 at free-electrons.com: 

>>       x86_64 |                     fltk-1.3.2 | NOK |
>>       http://autobuild.buildroot.net/results/58a36291201a848a0a11cbb2b20
>>       0c2b39434046c/ x86_64 |                     fltk-1.3.2 | NOK |
>>       http://autobuild.buildroot.net/results/fe53d0e9ad7c152105cb37a18e4
>>       d712bbde3398d/ 
> 
> Linking fluid...
> /home/peko/autobuild/instance-1/output/host/usr/x86_64-buildroot-linux-gn
> u/sysroot/usr/lib64/libxcb-shm.so.0: undefined reference to
> `xcb_get_reply_fds' 
> /home/peko/autobuild/instance-1/output/host/usr/x86_64-buildroot-linux-gn
> u/sysroot/usr/lib64/libxcb-shm.so.0: undefined reference to
> `xcb_send_fd' collect2: error: ld returned 1 exit status
> 
> Bernd, you are our X.org expert. Can you have a look? It might be worth
> mentioning that fltk 1.3.3 has been released on November 3rd, so we
> could try to upgrade and see if it fixes the problem.

Hi,

using fltk-1.3.2 I can not reproduce the problem.

Are any xcb packages installed locally on the autobuilders?
Locally this is not the case:

fli4l at fli4lbuild64:~/br2$ dpkg -l | grep xcb
fli4l at fli4lbuild64:~/br2$

Regards, Bernd
