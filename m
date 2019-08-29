From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Aug 2019 14:55:22 +0000
Subject: [Buildroot] [Bug 12131] qt5webengine builderror in the latest
 stable Buildroot 2019.05.01 version
In-Reply-To: <bug-12131-163@https.bugs.busybox.net/>
References: <bug-12131-163@https.bugs.busybox.net/>
Message-ID: <bug-12131-163-zHs5VQ5kQr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12131

--- Comment #10 from Patrick Koller <koller@stettbacher.ch> ---
Hi Giulio

Thanks for getting in touch again. Here are your requested informations:

- I am using buildroot 2019.05.1
- I attached my .config file (190829_buildroot_config.tar.gz)
- I want to build Qt 5.12.2

I am sorry, but "make savedefconfig" failed... I don't know why:

make savedefconfig
n*** Error while saving defconfig to:
/home/patrickk/tmp/buildroot/buildroot-2019.05.1/buildroot-2019.05.1/configs/polytab_defconfig

Makefile:1008: recipe for target 'savedefconfig' failed
make: *** [savedefconfig] Error 1

Thanks a lot.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
