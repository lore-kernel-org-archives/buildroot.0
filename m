From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Apr 2011 22:38:52 +0200
Subject: [Buildroot] barking up a different tree
In-Reply-To: <BANLkTi=EYF+b=d-LdM=bPXzaZ-7oZh-87A@mail.gmail.com> (Charles
	Krinke's message of "Sat, 23 Apr 2011 13:01:36 -0700")
References: <BANLkTi=EYF+b=d-LdM=bPXzaZ-7oZh-87A@mail.gmail.com>
Message-ID: <8762q4aejn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> Maybe I am barking up the wrong tree.

 Charles> Being able to do "make clean" and *not* have to re-compile the
 Charles> uclibc toolchain would get buildroot to an acceptable point
 Charles> for the uclibc part of my project.

Just build it once somewhere (E.G. set BR2_HOST_DIR to /opt/toolchain or
whatever), and then just configure BR to use it as an external
toolchain.

-- 
Bye, Peter Korsgaard
