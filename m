From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 23:57:38 +0200
Subject: [Buildroot] [PATCH 1/1] support/config-fragments: add RISC-V
 64-bit musl autobuild config
In-Reply-To: <20190731090319.21569-1-mark.corbin@embecosm.com> (Mark Corbin's
 message of "Wed, 31 Jul 2019 10:03:19 +0100")
References: <20190731090319.21569-1-mark.corbin@embecosm.com>
Message-ID: <87v9vgsg4t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark.corbin@embecosm.com> writes:

 > Add a RISC-V 64-bit autobuild configuration for the internal
 > toolchain with musl.

 > Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

We had some discussion about perhaps building a binary toolchain for
this for easier reproduction / time saving, but lets add this now and
then perhaps change once such a toolchain is available.

Committed, thanks.

-- 
Bye, Peter Korsgaard
