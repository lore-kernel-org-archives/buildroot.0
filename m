From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Sep 2016 23:51:27 +0200
Subject: [Buildroot] Hint on switching between targets
In-Reply-To: <ab1512c2-916c-4724-ecdf-2c0770fa1acd@dawncrow.de>
 (=?utf-8?Q?=22Andr=C3=A9?=
 Hentschel"'s message of "Mon, 19 Sep 2016 23:22:23 +0200")
References: <CAOMZO5BRPzX=cOpPJyH2ZmyxNhB6wu_EBFBm_DpcRz+Hd7MtKw@mail.gmail.com>
 <87h99b630z.fsf@dell.be.48ers.dk>
 <CAOMZO5BMOLDEq-xnwLBvX80biZ+-HJKVE1-U6xGx8CWXS-hBGg@mail.gmail.com>
 <ab1512c2-916c-4724-ecdf-2c0770fa1acd@dawncrow.de>
Message-ID: <87mvj34kyo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Hentschel <nerv@dawncrow.de> writes:

Hi,

 >>> If you just want to keep your warp7 output around while you build for
 >>> wandboard you can use out-of-tree builds - E.G.
 >>> 
 >>> make O=output-wandboard wandboard_defconfig
 >>> cd output-wandboard && make
 >> 
 >> That helps, thanks.

 > Isn't it easier to just do:

 > mv output output-warp7
 > make wandboard_defconfig

Well, yes - But then you cannot continue working on your warp7 build (as
the paths have changed). With out-of-tree builds you can swap between
your configurations without problems.

-- 
Bye, Peter Korsgaard
