From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jan 2012 11:20:18 +0100
Subject: [Buildroot] [PATCH] python-netifaces: add -x option to fix
 cross-compilation
In-Reply-To: <4F0ABA03.3030206@visionsystems.de>
References: <1326094927-27207-1-git-send-email-yegorslists@googlemail.com>
 <8739bpffv1.fsf@macbook.be.48ers.dk>
 <4F0ABA03.3030206@visionsystems.de>
Message-ID: <20120109112018.64832095@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 09 Jan 2012 10:57:23 +0100,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> That's really strange. I used CodeSourcery toolchain and had no
> problems, but with native BR toolchain I have the same behavior as
> yours. I'll look into this issue.

CodeSourcery toolchains use glibc, so they have IPv6 support enabled.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
