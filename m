From: daggs <daggs@gmx.com>
Date: Fri, 28 Dec 2018 11:11:17 +0100
Subject: [Buildroot] buildroot image over qemu doesn't get ip
Message-ID: <trinity-fcf0ec6d-0c93-4a6c-823e-2f2001f214bf-1545991877647@3c-app-mailcom-bs08>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I've created a buildroot image based on the qemu x64 config, I'm able to boot the vm but it doesn't seems to get any ip.
I've check the infrastructure with a similar vm config (network is the same) with a linux void installation and it works ok.
I'm using buildroot git, a week old I think.
here are the relevant configs:
buildroot: http://paste.ubuntu.com/p/JzHNsb82DC/
kernel: http://paste.ubuntu.com/p/VcPBhKFnq2/

any ideas what can be the issue? I've tried both busybox's dhcp client and the dhcp client pkg, neither worked.

Thanks,

Dagg.
