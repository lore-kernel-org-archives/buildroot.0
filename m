From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 18 Apr 2017 16:52:30 -0400
Subject: [Buildroot] [RFC 1/2] configs: raspberrypi3: fix mismatch cpu
 arch
In-Reply-To: <421eb275-49a1-eecc-1790-bee49228a243@mind.be>
References: <20170416151409.7665-1-gael.portay@savoirfairelinux.com>
 <20170416151409.7665-2-gael.portay@savoirfairelinux.com>
 <421eb275-49a1-eecc-1790-bee49228a243@mind.be>
Message-ID: <20170418205230.okjuyo45tjdbplb5@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, Apr 18, 2017 at 10:15:30PM +0200, Arnout Vandecappelle wrote:
> 
> On 16-04-17 17:14, Ga?l PORTAY wrote:
> > The raspberrypi3 is powered by a Broadcom BCM2837 which is a Cortex-A53.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Just to be sure: have you boot-tested the new defconfig?
> 

Yes, I have tested this new configuration.

As you can see in the second patch, this new configuration has broken the
compilation of qtbase.

>  Regards,
>  Arnout
> 

Regards,
Ga?l
