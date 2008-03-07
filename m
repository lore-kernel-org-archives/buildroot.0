From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Mar 2008 21:32:43 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20080307165445.F0789120159@busybox.net> (ninevoltz@uclibc.org's
	message of "Fri\, 7 Mar 2008 08\:54\:45 -0800 \(PST\)")
References: <20080307165445.F0789120159@busybox.net>
Message-ID: <878x0u6zro.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

Hi,

 ninevoltz>  	find $(TARGET_DIR) -name '*.la' -delete
 ninevoltz> +	find $(TARGET_DIR)/lib -name '*.a' -delete
 ninevoltz> +	find $(TARGET_DIR)/usr/lib -name '*.a' -delete

Uhh, what about the _HEADERS targets for development files (.h + .a in
TARGET_DIR)?

-- 
Bye, Peter Korsgaard
