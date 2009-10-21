From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 17:37:50 +0200
Subject: [Buildroot] building toolchain fails works now with cache
	disabled.
In-Reply-To: <C92DA876B3AA4BCA926AD2983C70B38B@apexjs> (Sagaert Johan's
	message of "Wed\, 21 Oct 2009 15\:42\:35 +0200")
References: <C92DA876B3AA4BCA926AD2983C70B38B@apexjs>
Message-ID: <87aazkrc4x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi

 Sagaert> Afrer disabling the cache it worked.

 Sagaert> Maybe the cache path was wrong, i used my .config file from the 2009.08
 Sagaert> version 
 Sagaert>  from the config file i read 

 Sagaert> BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"

 Sagaert> So i assume TOOLCHAIN_DIR is empty.

Hmm, odd - TOOLCHAIN_DIR is set to BASE_DIR/toolchain, where BASE_DIR is
normally "output".

-- 
Bye, Peter Korsgaard
