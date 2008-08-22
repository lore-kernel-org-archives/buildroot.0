From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Aug 2008 16:00:34 +0200
Subject: [Buildroot] [PATCH] gcc softfloat on powerpc
In-Reply-To: <1219347404.7367.21.camel@wberrierlx.appsig.com> (Wade Berrier's
	message of "Thu\, 21 Aug 2008 13\:36\:44 -0600")
References: <1219347404.7367.21.camel@wberrierlx.appsig.com>
Message-ID: <878wup2lq5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wade" == Wade Berrier <wberrier@gmail.com> writes:

 Wade> Hi,
 Wade> I'm running into the same situation described here:

 Wade> http://www.uclibc.org/lists/busybox/2007-July/028210.html

 Wade> I'm using softfloat on ppc, and also noticed that '-float-abi'
 Wade> is only for arm.

I don't quite see why openssl needs to mess with that setting, but it
does indeed seem fishy to use -mfloat-abit on non-ARM. Committed as
r23178 - Thanks.

-- 
Bye, Peter Korsgaard
