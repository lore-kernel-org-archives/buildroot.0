From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Apr 2009 19:13:33 +0200
Subject: [Buildroot] JFFS2 / MTD suggestions
In-Reply-To: <49DB861E.8040503@free.fr> (Cyril HAENEL's message of "Tue\,
	07 Apr 2009 18\:58\:06 +0200")
References: <20090407083540.15437e75@surf> <49DB861E.8040503@free.fr>
Message-ID: <874ox02xqa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

 Cyril> checking whether we are using the GNU C++ compiler...

 Cyril> 1 hour after it's alway blocked on the last line...

 Cyril> Any idea !?

Not really, but take a look at the configure script around there to
see what it is doing (add a few echo lines).

-- 
Bye, Peter Korsgaard
