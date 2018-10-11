From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 08:46:05 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <5c66f02e-d2f1-55a6-c75f-6a924e6b70bd@mind.be>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
 <5c66f02e-d2f1-55a6-c75f-6a924e6b70bd@mind.be>
Message-ID: <20181011084605.72277a0e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 23:30:39 +0200, Arnout Vandecappelle wrote:
> On 10/10/18 17:48, Thomas Petazzoni wrote:
> >>     mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/ab39280ceaf967e08abfd1f51efa4613495237f5 | ORPH  
> > 
> > gstspanplc.c:223:21: error: dereferencing pointer to incomplete type 'plc_state_t {aka struct plc_state_s}'
> >    if (plc->plc_state->missing_samples != 0)  
> 
>  Perhaps it's time to retire gstreamer-0.10? Is anybody still using it?

I am certainly OK to retire gstreamer-0.10. Could someone send a patch
series doing this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
