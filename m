From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 21:25:23 +0100
Subject: [Buildroot] Mysql compilation error with Buildroot
In-Reply-To: <8ebba8c20901251219x4419089mf9afb5970882ebb1@mail.gmail.com>
	(Mitesh Gupta's message of "Mon\, 26 Jan 2009 01\:49\:02 +0530")
References: <8ebba8c20901251219x4419089mf9afb5970882ebb1@mail.gmail.com>
Message-ID: <873af7f80c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mitesh" == Mitesh Gupta <guptamitesh@gmail.com> writes:

 Mitesh> Hi all,
 Mitesh> I am getting the following error when adding mysql client to the buildroot
 Mitesh> configuration

 Mitesh> g++ -Os -I/home/mitesh/buildroot-2009.02-rc2/build_i686/staging_dir/usr/include

It seems to be using your host compiler, not the cross one. I'll take
a look at it.

-- 
Bye, Peter Korsgaard
