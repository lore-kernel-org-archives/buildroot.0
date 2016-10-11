From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Oct 2016 21:53:07 +0200
Subject: [Buildroot] [PATCH v2] package/upmpdcli: add patch to fix error
	not detecting jsoncpp
In-Reply-To: <1476214719.1889.1.camel@embedded.rocks> (=?utf-8?Q?=22J?=
 =?utf-8?Q?=C3=B6rg?= Krause"'s message
 of "Tue, 11 Oct 2016 21:38:39 +0200")
References: <20160925141152.13952-1-joerg.krause@embedded.rocks>
 <8760oysmv5.fsf@dell.be.48ers.dk>
 <1476214719.1889.1.camel@embedded.rocks>
Message-ID: <871szmslwc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

Hi,

 >> While changing to pkg-config is perfectly fine (if upstream accepts
 >> it),
 >> this problem is really about jsoncpp's config.h using int64_t without
 >> including <stdint.h>

 > Gladly, upmpdcli accepted to use pkg-config and jsoncpp fixed this
 > issue in [1].

 > [1]?https://github.com/open-source-parsers/jsoncpp/commit/ab0f1e234aa40
 > 147e39cdfd0b97bf6527b8ea5e8

Ahh, ok - Perfect!

-- 
Venlig hilsen,
Peter Korsgaard 
