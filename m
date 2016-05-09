From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 09 May 2016 21:18:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-08
In-Reply-To: <20160509063023.2DB5D103487@stock.ovh.net>
References: <20160509063023.2DB5D103487@stock.ovh.net>
Message-ID: <1462821481.2493.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mo, 2016-05-09 at 08:30 +0200, Thomas Petazzoni wrote:
> Build statistics for 2016-05-08
> ===============================
> 
> Detail of failures
> ===================
> 
> ??????x86_64 |???????????????????apitrace-7.0 | NOK |
> http://autobuild.buildroot.net/results/7c49bafc67e4173ba93faba12beb19
> 776ac7cb8d/

Looks like GCC bug?54482 [1] produced by static linking with libstdc++.
Any suggestions how to resolve this? Remove GCC 4.7 support?
Add?BR2_TOOLCHAIN_HAS_GCC_BUG_54482?

[1]?https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54482

Best regards
J?rg Krause
