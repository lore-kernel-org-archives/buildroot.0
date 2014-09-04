From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Sep 2014 22:42:45 +0200
Subject: [Buildroot] [PATCH v2] bfin: disable newer binutils for
	internal toolchain
In-Reply-To: <20140904154111.GA8353@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Thu, 4 Sep 2014 17:41:12 +0200")
References: <20140904154111.GA8353@waldemar-brodkorb.de>
Message-ID: <87zjefp16i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > You get following linking error, when trying to build a
 > toolchain for bfin with newer binutils:
 > bfin-buildroot-linux-uclibc/bin/ld: fde encoding in _divdi3_s.o(.eh_frame) prevents .eh_frame_hdr table being created.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
