From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Oct 2017 18:34:41 +0200
Subject: [Buildroot] [PATCH v1] qt5base: remove nostrip qmake.conf
 config option
In-Reply-To: <20171027160522.21892-1-ps.report@gmx.net>
References: <20171027160522.21892-1-ps.report@gmx.net>
Message-ID: <20171027183441.529e95d6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Oct 2017 18:05:22 +0200, Peter Seiderer wrote:
> Re-enables the qmake default behaviour for qmake projects living
> out-side of buildroot (debug build with-out strip, release build with
> strip).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

What is the reasoning for this?

I think we do want qmake to *not* strip anything, and leave it to
Buildroot's BR2_STRIP_strip option to decide whether stripping should
happen or not.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
