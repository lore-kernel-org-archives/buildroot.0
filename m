From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Tue, 10 May 2011 10:47:35 +0800
Subject: [Buildroot] No input-event-daemon-v0.1.3.tar.gz
In-Reply-To: <BANLkTi=WgW=Z+JT4gOzxAfhnsMuNAmK-ZQ@mail.gmail.com>
References: <BANLkTi=WgW=Z+JT4gOzxAfhnsMuNAmK-ZQ@mail.gmail.com>
Message-ID: <BANLkTimDQ+dS-Xi+1VPt+WUeTw+ktYqxyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well, it works for me.

$ make source
make -C /opt/buildroot_real6410 O=/opt/buildroot_real6410/
output_fs2410/. source
>>> input-event-daemon v0.1.3 Downloading
Cloning into bare repository input-event-daemon-v0.1.3...
remote: Counting objects: 92, done.
remote: Compressing objects: 100% (90/90), done.
remote: Total 92 (delta 50), reused 0 (delta 0)
Receiving objects: 100% (92/92), 32.56 KiB, done.
Resolving deltas: 100% (50/50), done.

Could you attach your .config?

2011/5/9 Alexjan Carraturo <axjslack@gmail.com>

> Hi to all
>
> I?m Alexjan
>
> I'm new to this list... please let me know if I'm doing something wrong.
>
> While making 'make source' was impossibile to find ( on
> http://sources.buildroot.net/ ) the package of input-event-daemon. I
> download manually from github, but I think that this problem may be
> noisy for others user.
>
> Bye
>
> Axj.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Best Regards!
Kelvin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110510/e34057bc/attachment.html>
