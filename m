From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 11 Nov 2016 13:23:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-07
In-Reply-To: <20161108073019.811FA20D80@mail.free-electrons.com>
References: <20161108073019.811FA20D80@mail.free-electrons.com>
Message-ID: <a652d705-f8cd-c28e-08ed-4e9531ccb51c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 08/11/2016 ? 08:30, Thomas Petazzoni a ?crit :
> Hello,
> 
> Build statistics for 2016-11-07
> ================================
> 
>       successes : 179
>        failures : 69 
>        timeouts : 2  
>           TOTAL : 250
> 
> Classification of failures by reason
> ====================================
> 

>           libmicrohttpd-0.9.50 | 1 
> 
> 
> Detail of failures
> ===================
> 
>          arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/02df1e57b392a5ec7d4b812e9b0dd4f293c12160

It seems that the arm-cortex-m4 toolchain needs to be rebuild.

We need this fix:
https://git.buildroot.net/buildroot/commit/?id=90e38737a699a25f577684742c767375e74683c5

Best regards,
Romain
