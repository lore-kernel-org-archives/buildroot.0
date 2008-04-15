From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Tue, 15 Apr 2008 08:46:51 +0100
Subject: [Buildroot] atstk1002_defconfig problems and (possible) fix
In-Reply-To: <48045BB1.9000406@logicway.de>
References: <48045BB1.9000406@logicway.de>
Message-ID: <200804150846.51504.buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 15 April 2008, Arndt Kritzner wrote:
[...]
>
> this doesn't work any more:
> BR2_LINUX_COPYTO_TFTPBOOT=y
> BR2_LINUX_COPYTO=""
>
> > in my local copy changed to BR2_LINUX_COPYTO="/tftpboot"
>
> Gru? und tsch?s
> Arndt

I had the same problem, and fix; I notified HcE too...

Michel
