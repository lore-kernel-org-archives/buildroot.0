From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Oct 2009 09:41:34 +0200
Subject: [Buildroot] perl depends miniperl
In-Reply-To: <4AE12B1B.8000206@renta.net> (Mark Constable's message of "Fri\,
	23 Oct 2009 14\:03\:39 +1000")
References: <4AE07A68.8090403@renta.net> <87hbtrnpcu.fsf@macbook.be.48ers.dk>
	<4AE12B1B.8000206@renta.net>
Message-ID: <874opqo8up.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Constable <markc@renta.net> writes:

Hi,

 >> Our perl is miniperl, so there must be something broken in the
 >> miniperl package.

 Mark> I wish I could submit a fix but I think it'll take me months to
 Mark> get a good handle on buildroot and the use of Makefiles.

I'll take a look at it again next week.

 Mark> I really do not want perl at all. Certainly not on the target.
 >> 
 >> Then don't enable it ;)

 Mark> Unfortunately (for me) selecting the general devel install auto
 Mark> selects autoconf which in turn auto selects miniperl.

Ok, but there's nothing magic about the general devel thing. It's just a
handy way to select a certain subset of packages. If you don't want all
the packages of that subset, then just disable the devel thing and only
select the stuff you want.

-- 
Bye, Peter Korsgaard
