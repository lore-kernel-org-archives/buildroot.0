From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 18 Mar 2016 20:46:47 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-17
In-Reply-To: <20160318073022.D3E00102D67@stock.ovh.net>
References: <20160318073022.D3E00102D67@stock.ovh.net>
Message-ID: <1458330407.4235.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2016-03-18 at 08:30 +0100, Thomas Petazzoni wrote:
> Build statistics for 2016-03-17
> ===============================
> 
> ?????????arm |???????????????????squid-3.5.15 | NOK |
> http://autobuild.buildroot.net/results/7b9387713177e40759f9b50b32badf
> c1a64ee5a6/


Symbol name clash of base64_encode() both exported by squid and gnutls.
Issue reported upstream [1].

[1]?https://github.com/squid-cache/squid/issues/8

Best regards
J?rg Krause
