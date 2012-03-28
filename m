From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Mar 2012 11:32:54 +0200
Subject: [Buildroot] [PATCH 2/2] microperl: install host-microperl in
	$(HOST_DIR)/opt/perl
In-Reply-To: <20120328095532.71abc612@skate> (Thomas Petazzoni's message of
 "Wed, 28 Mar 2012 09:55:32 +0200")
References: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
 <87fwctb4gn.fsf@macbook.be.48ers.dk> <20120328095532.71abc612@skate>
Message-ID: <87bonhax4p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> However, I am worried by the case reported by Will Newton in:

 Thomas> From: Will Newton <will.newton@gmail.com>
 Thomas> To: buildroot at busybox.net
 Thomas> Subject: [Buildroot] Host libxml-parser-perl build issue
 Thomas> Date: Mon, 26 Mar 2012 17:35:29 +0100

 Thomas> In his case, the microperl for the target was not selected, so the
 Thomas> host-microperl was not built, and still he was having issues.

Yes, I've seen it. I don't really have a good idea about what we can do
about it though :/

-- 
Bye, Peter Korsgaard
