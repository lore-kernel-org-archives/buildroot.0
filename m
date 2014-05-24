From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 24 May 2014 16:29:06 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-23
In-Reply-To: <20140524063008.5FEFE101555@stock.ovh.net>
References: <20140524063008.5FEFE101555@stock.ovh.net>
Message-ID: <5380ACB2.2070402@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

Thomas Petazzoni wrote:
> Build statistics for 2014-05-23
> ===============================
>
>          success : 105
>         failures : 5
>         timeouts : 0
>            TOTAL : 110
>
> Classification of failures by reason
> ====================================
>
>          lttng-babeltrace-1.2.1 | 1
>                 audiofile-0.3.6 | 1
>                    samba-3.6.23 | 1
> znc-b396cafdb249544164ed029... | 1
>                    python-2.7.6 | 1
>
> Detail of failures
> ===================
>
>      mipsel |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/327c18db4e5d0ddc2c72a4684e103c19a1405e50/

Static linking issue, seen also on ppc and since at least in 0.3.4 in
January 2013.

Patch sent right now to disable audiofile with static linking:
http://patchwork.ozlabs.org/patch/352113/

-- 
Luca
