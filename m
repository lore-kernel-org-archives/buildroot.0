From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 20 Feb 2016 20:48:22 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-02-19
In-Reply-To: <20160220073017.2A200101DA7@stock.ovh.net>
References: <20160220073017.2A200101DA7@stock.ovh.net>
Message-ID: <1455997702.5444.6.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Detail of failures
> ===================
> 
> ?????????arm |???????????????????boost-1.60.0 | NOK |
> http://autobuild.buildroot.net/results/d6c77cf3f6ff259520a376f8329a03
> c5025c0663/

Looks like the gcc bug 58952 [1] to me. How do we handle this?

[1]?https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58952

Best regards
J?rg Krause
