From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 09:35:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/libupnp18: add upstream patch
 to fix runtime crash with musl
In-Reply-To: <20190509110438.31340-2-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Thu, 9 May 2019 13:04:38 +0200")
References: <20190509110438.31340-1-joerg.krause@embedded.rocks>
 <20190509110438.31340-2-joerg.krause@embedded.rocks>
Message-ID: <87muivupxc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Applications build with a musl 1.1.20+ toolchain and linked with libupnpp will
 > crash at runtime with `Illegal instruction` as musl is more strict with
 > trying to detach an already detached thread resulting in undefined
 > behaviour.

 > Upstream status:
 > https://github.com/mrjimenez/pupnp/issues/102

 > Backported from:
 > https://github.com/mrjimenez/pupnp/commit/04b454f693d0c71336252380d08f1d02967e133e

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
