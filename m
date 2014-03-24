From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Mar 2014 21:15:35 +0100
Subject: [Buildroot] [PATCH 1/1] host-mtools: Fix build failure
	introduced by libiconv dependency
In-Reply-To: <BLU0-SMTP166C506BEDB8CDC67D076CFD97A0@phx.gbl> (Bernd Kuhls's
 message of "Mon, 24 Mar 2014 20:29:45 +0100")
References: <BLU0-SMTP166C506BEDB8CDC67D076CFD97A0@phx.gbl>
Message-ID: <87r45rs68o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > Fixes http://autobuild.buildroot.net/results/8ff/8ff7fc94cc3e54f5608f7b4d2e6ccba5fd8e4177/
 > Also disable parallel make because "make install" is broken, see
 > http://lists.openembedded.org/pipermail/openembedded-commits/2011-October/134396.html

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
