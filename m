From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 9 Jun 2015 08:52:19 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-06-04
In-Reply-To: <20150605063013.14562100B13@stock.ovh.net>
References: <20150605063013.14562100B13@stock.ovh.net>
Message-ID: <1433839938.3732.5.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2015-06-05 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-06-04
> ===============================
> 
>         success : 14 
>        failures : 1  
>        timeouts : 0  
>           TOTAL : 15 
> 
> Classification of failures by reason
> ====================================
> 
>              ntfs-3g-2015.3.14 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |              ntfs-3g-2015.3.14 | NOK | http://autobuil
> d.buildroot.net/results/7227d5f01755affa2a234eedd8d1fc8c826395c7/
> 

Looks like Peter already fixed this in http://git.buildroot.net/buildro
ot/commit/package/ntfs-3g?id=174b8469029cb8018200516a00a5b890ec7cd1a8

-Alexey
