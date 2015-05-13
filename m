From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 13 May 2015 20:53:15 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-05-10
In-Reply-To: <20150511063014.10BC4100F6A@stock.ovh.net>
References: <20150511063014.10BC4100F6A@stock.ovh.net>
Message-ID: <1431550395.3047.14.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2015-05-11 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-05-10
> ===============================
> 
>         success : 19 
>        failures : 1  
>        timeouts : 0  
>           TOTAL : 20 
> 
> Classification of failures by reason
> ====================================
> 
>       host-gdb-arc-2014.12-gdb | 1 
> 
> Detail of failures
> ===================
> 
>          arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/aeb2c1e8ef895c1963eff5fbba3fc9b2e12b70cf/

Looks like that could be fixed by copy of "851-PR-other-56780.patch" to
"package/binutils/arc-2014.12" since arc-2014.12 binutils are basd on
upstream 2.23 and so corresponding patches are missing

Discussing this with Romain.

-Alexey
