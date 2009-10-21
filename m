From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 17:39:31 +0200
Subject: [Buildroot] problem solved : configure:1745: error: C compiler
	cannot create executables
In-Reply-To: <57DB4D275D074D809847969FA4D2D702@apexjs> (Sagaert Johan's
	message of "Wed\, 21 Oct 2009 16\:37\:21 +0200")
References: <57DB4D275D074D809847969FA4D2D702@apexjs>
Message-ID: <8763a8rc24.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> The problem was the name of the cache directoy variable
 
 Sagaert> I used my .config from the 2009.08 in the current release version.
 
 
 Sagaert> in the 2009.08 release :

 Sagaert> BR2_CCACHE_DIR="$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"

 Sagaert> now the line reads

 Sagaert> BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"

Ahh yes. That change was done on Sep 23rd (cb5710c538f).

-- 
Bye, Peter Korsgaard
