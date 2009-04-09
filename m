From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Apr 2009 11:58:42 +0200
Subject: [Buildroot] target/Makefile.in problem
In-Reply-To: <22967644.post@talk.nabble.com> (Andreas Schweigstill's message
	of "Thu\, 9 Apr 2009 02\:46\:19 -0700 \(PDT\)")
References: <10d6046f0903270152p681242fekf02862a27d0797ab@mail.gmail.com>
	<87myb4cbno.fsf@macbook.be.48ers.dk> <22967644.post@talk.nabble.com>
Message-ID: <87skkixi5p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Schweigstill <andreas@schweigstill.de> writes:

Hi,

 Andreas> I notice the same behavior when trying to build
 Andreas> buildroot-2009.02 on an old SuSE Linux 9.3 system (from
 Andreas> ~2005). It uses make 3.80 and GCC 3.3.5, so it is quite
 Andreas> old-fashioned. On newer systems (openSUSE 10.3 and 11.0)
 Andreas> with GNU make 3.82 I don't have any problems. But due to
 Andreas> some customer's requirements I have to setup a buildroot
 Andreas> environment which also builds on old Linux systems.

Ok, do you have a workaround that works with 3.80? My machines all
have atleast 3.81 - Otherwise I'll simply enforce 3.81+ in the
dependencies check.

-- 
Bye, Peter Korsgaard
