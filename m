From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Nov 2012 18:10:34 +0100
Subject: [Buildroot] [PATCH 01/23] dependencies.sh: remove makeinfo
 (texinfo) from the requirement list
In-Reply-To: <1352639701-27829-2-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
 <1352639701-27829-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20121111181034.33a1c150@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 11 Nov 2012 14:14:39 +0100, Samuel Martin wrote:
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Why do you think they are no longer necessary? IIRC, they are needed
for the build of binutils/gcc during the internal backend toolchain
build. But I admittedly haven't tested building with these recently.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
