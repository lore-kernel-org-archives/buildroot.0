From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 28 Nov 2019 22:55:35 +0100
Subject: [Buildroot] Logs on console
In-Reply-To: <1574658915896-0.post@n4.nabble.com>
References: <1574658915896-0.post@n4.nabble.com>
Message-ID: <20191128225535.42941a34@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anushka,

On Sun, 24 Nov 2019 23:15:15 -0600 (CST), a <anushka.parashar@tesco.com> wrote:

> How do I disable messages or logging from printing on the console?

Not a very unambiguous question, do you mean the messages while
doing a buildroot build, or do you mean the messages while booting
your device/hardware?

The first meaning is more a general unix question:
	$ make > /dev/null 2>&1

The second meaning is more a general linux-kernel or
linux-startup-system question (and not very buildroot specific)...

Regards,
Peter

>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
