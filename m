From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Nov 2009 22:56:51 +0100
Subject: [Buildroot] Build jobbing
In-Reply-To: <200911271522.58858.minimod@morethan.org> (Michael S. Zick's
	message of "Fri\, 27 Nov 2009 15\:22\:55 -0600")
References: <200911271522.58858.minimod@morethan.org>
Message-ID: <877htb638c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 Michael> When Buildroot is tested, do you use anything other than: -j1?

Sure.

 Michael> I have been using -j5 to keep my quad-core out of the idle loop;
 Michael> but am beginning to suspect there is something not right about that.

Notice that you have to set BR2_JLEVEL under build options - The
toplevel make must NOT be run with -jN.

-- 
Bye, Peter Korsgaard
