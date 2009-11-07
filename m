From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Nov 2009 11:17:07 +0100
Subject: [Buildroot] Add packages
In-Reply-To: <fffd86390911030644u464ebae0m8678f4d812e1037d@mail.gmail.com>
	(Francisco Gonzalez's message of "Tue\,
	3 Nov 2009 15\:44\:35 +0100")
References: <fffd86390910140137p5292921k973c127039d6e0d4@mail.gmail.com>
	<87hbu11xbu.fsf@macbook.be.48ers.dk>
	<fffd86390911030644u464ebae0m8678f4d812e1037d@mail.gmail.com>
Message-ID: <87eioavduk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francisco" == Francisco Gonzalez <gzmorell@gmail.com> writes:

Hi,

 Francisco> Should I use the git version in order to create the patch, I
 Francisco> use the 2009.08 version?

Preferably git.

 Francisco> How can I check what are the dependencies of the packages?,
 Francisco> these compiles fine with the settings I use but I do not
 Francisco> know what happens if some packages have not been selected?

It's normally clear from looking at configure.ac and/or a README. If
that fails, just try to do a clean build with no other packages enabled.

-- 
Bye, Peter Korsgaard
