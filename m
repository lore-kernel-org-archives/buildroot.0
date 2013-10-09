From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 16:01:34 +0200
Subject: [Buildroot] [PATCHv3 12/20] toolchain-external: add support for
	musl C library
In-Reply-To: <1381256237-27948-13-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:17:09 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bo2y35mp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit adds support for external toolchains based on the musl C
 Thomas> library, as available from http://www.musl-libc.org.

 Thomas> Note that the pre-built musl toolchains available from
 Thomas> http://musl.codu.org/ are not working for the moment, since they lack
 Thomas> sysroot support. However, this problem has been reported to the
 Thomas> maintainer, who has already added sysroot support in his scripts at
 Thomas> https://bitbucket.org/GregorR/musl-cross, and therefore the next
 Thomas> version of the pre-built toolchains should work with Buildroot
 Thomas> out-of-the-box. In the mean time, the musl-cross script must be used
 Thomas> to build the toolchain.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Thomas> +# Check that the selected C library is really musl

s/is really/really is/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
