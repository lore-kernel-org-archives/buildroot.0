From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Nov 2013 23:33:58 +0100
Subject: [Buildroot] [PATCH v2 2/2] libglib2: the system PCRE needs to
	have UTF and UCP enabled
In-Reply-To: <1385157507.14731.31.camel@bender> (Sven Neumann's message of
 "Fri, 22 Nov 2013 22:58:27 +0100")
References: <1385157507.14731.31.camel@bender>
Message-ID: <87eh68nk15.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:

 > If glib2 is compiled with the system PCRE instead of the included
 > copy, then that system PCRE needs to have support for UTF-8 and
 > Unicode properties enabled. Otherwise you will get such warnings
 > at run-time:

 > GLib-CRITICAL **: PCRE library is compiled without UTF8 support
 > GLib-CRITICAL **: PCRE library is compiled without UTF8 properties support

 > Signed-off-by: Sven Neumann <neumann@teufel.de>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
