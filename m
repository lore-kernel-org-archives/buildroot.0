From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Oct 2008 08:35:24 +0100
Subject: [Buildroot] Bind compile problems
In-Reply-To: <ea6cc0c70810282014v2fdbe57ev542ad4cfe9c763b3@mail.gmail.com>
	(David A. Bandel's message of "Tue\,
	28 Oct 2008 22\:14\:15 -0500")
References: <ea6cc0c70810282014v2fdbe57ev542ad4cfe9c763b3@mail.gmail.com>
Message-ID: <877i7rc0qr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David A Bandel <david.bandel@gmail.com> writes:

 David> Folks,
 David> Having a slight problem building bind-9.3.2 from svn:

 David> /opt/buildroot/build_mips/bind-9.3.2/lib/isc/.libs/libisc.so:
 David> undefined reference to `index'

Fixed in r23844.

-- 
Bye, Peter Korsgaard
