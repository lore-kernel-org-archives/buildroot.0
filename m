From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Mon, 4 Nov 2013 07:54:46 -0600
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131102110529.4e98755d@skate>
References: <20131029204108.5d707d09@skate> <20131101193153.04cdd643@skate>
 <52749C54.8080601@writeme.com> <20131102110529.4e98755d@skate>
Message-ID: <OFB4B6CB56.2E41FF6A-ON86257C19.004BFC69-86257C19.004C6CF8@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot-bounces at busybox.net wrote on 11/02/2013 05:05:29 AM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Sinan Akman <sinan@writeme.com>
> Cc: "Zhang, Sonic" <Sonic.Zhang@analog.com>, chrisgriffith at cox.net, 
> Jan Viktorin <xvikto03@stud.fit.vutbr.cz>, buildroot at uclibc.org, 
> Mischa Jonker <Mischa.Jonker@synopsys.com>, Spenser Gilliland 
> <spenser309@gmail.com>
> Date: 11/02/2013 05:05 AM
> Subject: Re: [Buildroot] Architecture build statistics
> Sent by: buildroot-bounces at busybox.net
> 
> Dear Sinan Akman,
> 
<snip>
> 
> +--------------------------------------------+-----+
> | reason                                     | cnt |
> +--------------------------------------------+-----+
> | trace-cmd-trace-cmd-v2.2.1                 | 219 |
> | host-util-linux-2.23.2                     |  41 |
> | gstreamer-0.10.36                          |  33 |
> | php-5.3.27                                 |  18 |
> | make: *** [uboot-tools-legal-info] Error 1 |  16 |
> | w_scan-20130331                            |  16 |
> | bison-3.0                                  |  14 |
> | nano-2.3.2                                 |  11 |
> | omniorb-4.1.6                              |  10 |

A patch has been submitted to fix omniorb.
(Oct 21st, "omniorb: fix autobuilder failure")

> | mpd-0.17.6                                 |  10 |
> | cryptsetup-1.6.2                           |  10 |
<snip>

Thanks!

Matt Weber
mlweber1 at rockwellcollins.com
