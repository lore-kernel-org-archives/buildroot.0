From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Mar 2009 22:32:59 +0200
Subject: [Buildroot] target/Makefile.in problem
In-Reply-To: <10d6046f0903270152p681242fekf02862a27d0797ab@mail.gmail.com>
	(Mirko ROCCO's message of "Fri\, 27 Mar 2009 09\:52\:58 +0100")
References: <10d6046f0903270152p681242fekf02862a27d0797ab@mail.gmail.com>
Message-ID: <87myb4cbno.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mirko" == Mirko ROCCO <mirko.rocco@gmail.com> writes:

Hi,

 Mirko> Hi, I have downloaded the last snapshot of buildroot by means
 Mirko> of svn...  After menuconfig(-uration) for target PowerPC I
 Mirko> give "make source" command but the compilation right there
 Mirko> fails with this error:

 Mirko> target/Makefile.in:22: Extraneous text after `else' directive
 Mirko> target/Makefile.in:38: *** only one `else' per conditional. Stop.

Strange, I use powerpc almost every day and have never seen that
error. Please post your .config and tell us what host distribution and
make version (type make --version) you are using.

-- 
Bye, Peter Korsgaard
