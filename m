From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Sep 2009 08:59:11 +0200
Subject: [Buildroot] [PATCH 1/5] Remove the "project" feature
In-Reply-To: <20090908082707.18e19d6e@hcegtvedt.norway.atmel.com>
	(Hans-Christian Egtvedt's message of "Tue\,
	8 Sep 2009 08\:27\:07 +0200")
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
	<20090908082707.18e19d6e@hcegtvedt.norway.atmel.com>
Message-ID: <87pra153cw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 Hans-Christian> I use it all the time ;) How do you propose building
 Hans-Christian> for multiple targets? I would at least like to share
 Hans-Christian> the toolchain, preferably also libraries.

The toolchain could fairly easily be shared with the external toolchain
stuff we now have.

I don't know about your targets, but for the configurations I'm using,
the time to rebuild userland packages is insignificant compared to
toolchain building.

This is ofcourse less true if you need to build something big like
X/gtk/Qt/..

 Hans-Christian> I do however also like the KISS aspect of Buildroot.

Yes, it does add quite some complexity.

 Hans-Christian> I did not think project_build_ARCH was confusing, but
 Hans-Christian> perhaps project_ part would be misleading? I would
 Hans-Christian> rather see a build/board/<stuff> setup.

Keeping status quo and renaming directories will just lead to more
confusion imho.

-- 
Bye, Peter Korsgaard
