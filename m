From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 08:08:58 +0200
Subject: [Buildroot] [PATCH] toolchain-wrapper: do not use deprecated
 -mfused-madd
In-Reply-To: <20170811052847.GA32348@waldemar-brodkorb.de>
References: <20170811052847.GA32348@waldemar-brodkorb.de>
Message-ID: <20170811080858.336ba4d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Aug 2017 07:28:48 +0200, Waldemar Brodkorb wrote:
> GCC deprecated -mfused-madd, -ffp-contract=off should
> be used for Xburst workaround.
> uClibc compilations will fail, because a gcc warning
> is emitted while checking for TLS support in the compiler.

In which gcc version was -ffp-contract=off added ? Can we use that
unconditionally, or is it only available in recent gcc versions ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
