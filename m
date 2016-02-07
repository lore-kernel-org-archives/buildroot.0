From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 07 Feb 2016 18:19:30 +0100
Subject: [Buildroot] [PATCH] procps-ng: drop pidof/watch file moves
References: <1454864915-20383-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <2uakocxnoh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 07 Feb 2016 14:08:35 -0300 schrieb Gustavo Zacarias:

> The new version bumped in 8239f454 installs them correctly to /bin so
> this breaks the build. Fixes:
> http://autobuild.buildroot.net/
results/278/278e3a30173e241561336476cc484f1224ee71f9/

Hi Gustavo,

your patch is a duplicate of http://patchwork.ozlabs.org/patch/576728/ ;)

Regards, Bernd
