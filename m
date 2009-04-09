From: Andreas Schweigstill <andreas@schweigstill.de>
Date: Thu, 9 Apr 2009 02:46:19 -0700 (PDT)
Subject: [Buildroot] target/Makefile.in problem
In-Reply-To: <87myb4cbno.fsf@macbook.be.48ers.dk>
References: <10d6046f0903270152p681242fekf02862a27d0797ab@mail.gmail.com>
	<87myb4cbno.fsf@macbook.be.48ers.dk>
Message-ID: <22967644.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



jacmet wrote:
> 
>>>>>> "Mirko" == Mirko ROCCO <mirko.rocco@gmail.com> writes:
> 
>  Mirko> target/Makefile.in:22: Extraneous text after `else' directive
>  Mirko> target/Makefile.in:38: *** only one `else' per conditional. Stop.
> 
> Strange, I use powerpc almost every day and have never seen that
> error. Please post your .config and tell us what host distribution and
> make version (type make --version) you are using.
> 

I notice the same behavior when trying to build buildroot-2009.02 on an
old SuSE Linux 9.3 system (from ~2005). It uses make 3.80 and
GCC 3.3.5, so it is quite old-fashioned. On newer systems (openSUSE
10.3 and 11.0) with GNU make 3.82 I don't have any problems. But
due to some customer's requirements I have to setup a buildroot
environment which also builds on old Linux systems.

With best regards
Andreas Schweigstill

-- 
View this message in context: http://www.nabble.com/target-Makefile.in-problem-tp22737921p22967644.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
