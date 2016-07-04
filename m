From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:27:00 +0200
Subject: [Buildroot] [PATCH] gcc: uClinux supports POSIX threads
In-Reply-To: <20160702185327.GA17114@waldemar-brodkorb.de>
References: <20160702185327.GA17114@waldemar-brodkorb.de>
Message-ID: <20160704112700.27a4d395@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Jul 2016 20:53:27 +0200, Waldemar Brodkorb wrote:

> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org> 

There was a trailing white space here, and in all other Signed-off-by
line. I've fixed this and applied your patch. Thanks!

Of course, one unfortunate thing is that if we use external toolchains
for Cortex-M3/M4, they will suffer for this issue and cause build
failures. But since we don't have such toolchains now, and I don't
really expect to have any in the future, it's probably fine. I hope
that the gcc fixes will get merged.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
