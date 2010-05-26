From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 May 2010 00:45:35 +0200
Subject: [Buildroot] a remark on the default uclibc0.9.31 config
In-Reply-To: <8A567CE999EB4F76B3865E87F6BC7AC4@apexjs> (Sagaert Johan's
	message of "Sat, 22 May 2010 00:53:08 +0200")
References: <8A567CE999EB4F76B3865E87F6BC7AC4@apexjs>
Message-ID: <87ocg2mgds.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> With this set in the default uclibc config
 
 Sagaert> FORCE_SHAREABLE_TEXT_SEGMENTS=y
 
 Sagaert> I got this:when starting mpg123
 
 Sagaert> # mpg123

 Sagaert> Can't modify /usr/lib/libmpg123.so.0's text section. Use GCC
 Sagaert> option -fPIC for shared objects, please.
  Sagaert> So i turned this option off and after rebuild the mpg123 does
 Sagaert> no longer produce this error.
 
 Sagaert> There might be more programs sensitive to this setting.

Fixed, thanks.

-- 
Bye, Peter Korsgaard
