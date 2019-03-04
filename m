From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Mar 2019 22:36:40 +0100
Subject: [Buildroot] [PATCH 2/2] package/libsoxr: add patch to add
 Libs.private in soxr.pc
In-Reply-To: <20190222010714.22028-2-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Fri, 22 Feb 2019 02:07:14 +0100")
References: <20190222010714.22028-1-joerg.krause@embedded.rocks>
 <20190222010714.22028-2-joerg.krause@embedded.rocks>
Message-ID: <87sgw2gw47.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > If libsoxr is build statically against libavutil other applications
 > needs to know that they must link with `-lavutil` when building in a
 > static context.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
