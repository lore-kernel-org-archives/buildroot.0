From: daggs <daggs@gmx.com>
Date: Thu, 6 Oct 2016 08:11:37 +0200
Subject: [Buildroot] odroidc2 broken in latest git
Message-ID: <trinity-97d923e3-1509-4df6-8cea-c6856bedc7ff-1475734297864@3capp-mailcom-bs04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings all,

following a complaint posted in the odroid forums I tried to boot latest git with mininal config on my odroidc2 board and it doesn't boot.
I've booted the last commit I know to work (61b6abb2a2198d0a659d305ac3dd813a1f900aa1) and it indeed boots.
I've checked the odroidc2 file's logs and there were no changes done after the commit mentioned above.

has there been any structural change that might cause this behavior?

does anyone might have a guess on which commit might be the bad one? that will reduce the bisection size.

Thanks,

Dagg.
