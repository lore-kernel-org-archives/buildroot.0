From: Andreas Ziegler <br015@umbiko.net>
Date: Thu, 06 Aug 2020 09:10:02 +0200
Subject: [Buildroot] I need help to solve this error.
In-Reply-To: <mailman.13.1596628803.136533.buildroot@busybox.net>
References: <mailman.13.1596628803.136533.buildroot@busybox.net>
Message-ID: <df54940149129e4a0c7e7661497c2662@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Date: Tue, 4 Aug 2020 15:31:17 -0400
> From: User Name <us53rnam3@gmail.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] I need help to solve this error.

> scripts/Kconfig.include:39: compiler 'arm-linux-gcc' not found

Your external toolchain is not accessible via $PATH.
