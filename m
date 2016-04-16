From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 16 Apr 2016 13:10:48 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-04-15
In-Reply-To: <20160416063023.B075B101922@stock.ovh.net>
References: <20160416063023.B075B101922@stock.ovh.net>
Message-ID: <1460805048.8200.33.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sa, 2016-04-16 at 08:30 +0200, Thomas Petazzoni wrote:
> Build statistics for 2016-04-15
> ===============================
> 
> 
> Detail of failures
> ===================
> 
> ?????powerpc |????????????????ipmitool-1.8.16 | NOK |
> http://autobuild.buildroot.net/results/9e99aa8aebf68667b8c054b64e49de
> 6dd73dd53d/

Issue can be solved by include <stddef.h> for wchar_t. I'll propose a
patch for this...

Best regards
J?rg Krause
