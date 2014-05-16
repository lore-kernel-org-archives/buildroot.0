From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 May 2014 22:42:36 +0200
Subject: [Buildroot] [PATCH] package/avahi: does not build with
 static-only
In-Reply-To: <20140516184954.GA3466@free.fr>
References: <1400256681-30273-1-git-send-email-yann.morin.1998@free.fr>
 <20140516201650.5805db3e@free-electrons.com>
 <20140516184954.GA3466@free.fr>
Message-ID: <20140516224236.1ce49506@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 16 May 2014 20:49:54 +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2014-05-16 20:16 +0200, Thomas Petazzoni spake thusly:
> > Dear Yann E. MORIN,
> > 
> > On Fri, 16 May 2014 18:11:21 +0200, Yann E. MORIN wrote:
> > > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > > 
> > > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > > ---
> > >  package/avahi/Config.in | 1 +
> > >  1 file changed, 1 insertion(+)
> > 
> > Autobuilder reference?
> 
> Gah, I forgot to add it...
> 
> Fixes (which I reproduced here):
>     http://autobuild.buildroot.net/results/ea2/ea2c8f20c4032bf82876805ea787a55834091cec

To me, it doesn't really seem like an impossibility of building Avahi
with static libraries. Shouldn't we look a little bit harder at fixing
the configure problem?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
