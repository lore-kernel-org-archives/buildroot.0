From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 08:38:49 +0100
Subject: [Buildroot] [PATCH] package/qt: disable Qt GUI module for CS
 NiosII toolchain
In-Reply-To: <1450911817-12589-1-git-send-email-romain.naour@gmail.com>
References: <1450911817-12589-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20151224083849.381556a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu, 24 Dec 2015 00:03:37 +0100, Romain Naour wrote:
> The libQtGui.so build triggers an ld error with Binutils 2.25.1
> 
> Avoid (GCC 5.2 and Binutils 2.25.51):
> http://autobuild.buildroot.net/results/c94/c945bce96966e5e39d093c4265058a66f749eea6
> 
> Similar (GCC 4.9.3 and Binutils 2.25.1):
> http://autobuild.buildroot.net/results/ca9/ca981c419bfedb38c591f6e75151a943bc9535ef
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Can you check if the internal NIOSII toolchain also has this problem or
not?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
