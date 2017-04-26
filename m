From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 26 Apr 2017 12:31:43 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-04-25
In-Reply-To: <20170426142020.41d27312@free-electrons.com>
References: <20170426062839.7446620CA4@mail.free-electrons.com>
 <1101594360.20478325.1493204871665.JavaMail.zimbra@datacom.ind.br>
 <20170426142020.41d27312@free-electrons.com>
Message-ID: <1493209902.20370.12.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Carlos,

On Wed, 2017-04-26 at 14:20 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 26 Apr 2017 08:07:51 -0300 (BRT), Carlos Santos wrote:
> > 
> > > 
> > > From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> > > To: buildroot at buildroot.org
> > > Sent: Wednesday, April 26, 2017 3:28:39 AM
> > > Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-25??
> > ---8<---
> > > 
> > > Build statistics for 2017-04-25
> > > ================================
> > > ????????arc |??????????????util-linux-2.29.2 | NOK |
> > > ????????https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_9bf1c9e84cab64bccc3c86
> > > a8a2899cd71b8f91d4&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=TGSQU5OmhW2MMpwoOAMzisELo4MA911p_P_3e_q7vKU&m=N9a4hmvdGH1D2
> > > rs8RbKNEdMRhDWW1f37sVYgRbeq7o8&s=wrrO_-jpofxrQQkZ0cdGnk6cOtLqTTZcE2y7F6NWyOQ&e=???
> > ---8<---
> > 
> > Regression caused by commit 5f8ef7e25c5cc5c2e4ae4c8b6e8caa029ddf9a94.
> > 
> > Should we revert it?
> 
> Let's wait a bit for Vlad's input on this, Synopsys is usually quite
> reactive in providing fixes for toolchain issues on ARC.
> 
> Vlad?

Yes, we are already looking at the issue and I hope we will provide a fix pretty soon.

So please don't revert it - we will either update our toolchain version or provide of-the-tree patches to "cure" this
problem ASAP.

Thanks.

> 
> Thomas
-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
