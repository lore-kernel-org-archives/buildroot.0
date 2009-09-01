From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Sep 2009 07:36:43 +0200
Subject: [Buildroot] bash fails to compile with git tree
In-Reply-To: <1251715165.5021.9.camel@sven> (Sven Neumann's message of "Mon\,
	31 Aug 2009 12\:39\:25 +0200")
References: <159a01660908280221m79835c8dy88aba6ce39dc4bff@mail.gmail.com>
	<87pracqtzg.fsf@macbook.be.48ers.dk> <1251715165.5021.9.camel@sven>
Message-ID: <8763c3ql90.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> I do frequently get errors when building bash. Perhaps in one out
 Sven> of three builds, compilation of bash aborts. This is always
 Sven> easily fixed by typing 'make bash', followed by 'make' to
 Sven> continue the build. My guess is that it is a problem with
 Sven> parallel builds. We use BR2_JLEVEL=4.

Hmm, that shouldn't be the case as bash.mk uses MAKE1 everywhere.

-- 
Bye, Peter Korsgaard
