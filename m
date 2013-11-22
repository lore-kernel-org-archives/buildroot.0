From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Nov 2013 23:35:47 +0100
Subject: [Buildroot] [PATCH 1/2] mpg123: do not disable optimizations
In-Reply-To: <1385157641.14731.34.camel@bender> (Sven Neumann's message of
 "Fri, 22 Nov 2013 23:00:41 +0100")
References: <1385157641.14731.34.camel@bender>
Message-ID: <87a9gwnjy4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:

 > It seems pointless to disable even the default optimizations.
 > If at all this should be made dependant on the values of the
 > BR2_OPTIMIZE variables.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
