From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 7 Feb 2012 09:51:09 +0100
Subject: [Buildroot] FW: Buildroot RFS Login Question
In-Reply-To: <CB4468D5.2D36%donald.poole@swri.org>
References: <CB44467D.2D31%donald.poole@swri.org>
 <CB4468D5.2D36%donald.poole@swri.org>
Message-ID: <CAHXCMM+Y-gHrkSCuZVmDkDNqLKqkdGCfmXVj=xuA-o9wPsEjew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Unfortunately, if I use the root user get a "Login Incorrect" message and a
> new login prompt that looks like this:
> Starting input-event-daemon: done
>
> Welcome to VICTORY Embedded
> victory-embedded login: root
> Login incorrect
>
> victory-embedded login:
>

It may be stupid, but could you check that /etc/passwd and /etc/shadow
are valid in the rootfs.
I did spend some time debugging rootfs with a valid /etc/passwd and
empty /etc/shadow whereas it should not.


Sam
