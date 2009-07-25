From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Jul 2009 09:28:49 +0200
Subject: [Buildroot] error about compile gcc
In-Reply-To: <3a665c760907240136y2c27829cq78899f6e3aac39f7@mail.gmail.com>
	(loody's message of "Fri\, 24 Jul 2009 16\:36\:45 +0800")
References: <3a665c760907230115w47500c7ai1e7a8339f01e907a@mail.gmail.com>
	<87prbrbofx.fsf@macbook.be.48ers.dk>
	<3a665c760907240136y2c27829cq78899f6e3aac39f7@mail.gmail.com>
Message-ID: <87ocr98bm6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "loody" == loody  <miloody@gmail.com> writes:

 loody> thanks for your kind help.
 loody> I find the problem will come out when I change the .config of uclibc.

what exactly did you change in the uclibc config? did you do a clean
rebuild afterwards? (rm -rf *build_*; make)

-- 
Bye, Peter Korsgaard
