From: daggs <daggs@gmx.com>
Date: Fri, 11 Sep 2020 07:53:09 +0200
Subject: [Buildroot] how to reproduce autobuild failure?
Message-ID: <trinity-19ccadb5-7d6f-44a4-9552-791e69ceae52-1599803589362@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I've received a mail stating a pkg I maintained failed autobuild.
so I've syned my builroot folder to latest, entered the link, downloaded the defconfig to .config, ran make clean oldconfig,
pressed enter for all options, made sure the .config included my pkg and ran make.
after a while, I got a complete image, e.g. the failure didn't reproduced.
assuming that the issue wasn't resolved, I'm doing something wrong.

what is the proper process I need to follow?

Thanks,

Dagg
