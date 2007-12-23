From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 24 Dec 2007 01:50:46 +0200 (EET)
Subject: [Buildroot] Build error
In-Reply-To: <476BF768.3050201@carallon.com>
References: <476A7DA6.7000102@carallon.com> <476A9199.4080900@promwad.com>
	<476BF768.3050201@carallon.com>
Message-ID: <40135.127.0.0.1.1198453846.squirrel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Thanks for the hint.
>
> I have compiled both with and without qtopia4 and got the verbose log. I
> can not see any difference on what is on the command line between the
> two versions.
>

Will,

I can suggest as workaround to set BR2_KERNEL_none=y
and build kernel outside a buildroot tree and see if it working this way.

Regards,
Ivan
