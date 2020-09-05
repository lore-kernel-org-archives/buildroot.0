From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 05 Sep 2020 23:10:16 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/multipath-tools: new package
In-Reply-To: <20200905215837.1851ab18@windsurf.home>
References: <20200905192015.1346-1-egorenar-dev@posteo.net>
 <20200905215837.1851ab18@windsurf.home>
Message-ID: <87h7scudzb.fsf@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> uxsock.c:20:10: fatal error: systemd/sd-daemon.h: No such file or directory
>  #include <systemd/sd-daemon.h>
>           ^~~~~~~~~~~~~~~~~~~~~
> compilation terminated.

I can confirm it. It is reproducible inside a Fedora Container with the packages
systemd-devel & pkf-config installed. I'll fix it and report back.

Regards
Alex
