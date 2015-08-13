From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 13 Aug 2015 11:24:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-08-12
In-Reply-To: <20150813063012.509E9101E41@stock.ovh.net>
References: <20150813063012.509E9101E41@stock.ovh.net>
Message-ID: <1439457872.4131.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Do, 2015-08-13 at 08:30 +0200, Thomas Petazzoni wrote:
> Build statistics for 2015-08-12
> ===============================
> 
>         success : 118
>        failures : 24 
>        timeouts : 0  
>           TOTAL : 142
> 
> Detail of failures
> ===================
> 
>          arm |                      mtd-1.5.2 | NOK | 
> http://autobuild.buildroot.net/results/712d16b205cd7811da239a318abfc0
> 0c9900f860/

If libuuid is build with gettext support, the mkfs.ubifs target needs
to be linked against lintl.

I'll prepare a patch for this.

Best regards
J?rg Krause
