From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 26 Jun 2016 13:20:52 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <20160615215258.5e9e85a6@free-electrons.com>
References: <20160601232654.07800a9b@free-electrons.com>
 <20160615215258.5e9e85a6@free-electrons.com>
Message-ID: <1466940052.32055.17.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mi, 2016-06-15 at 21:52 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 1 Jun 2016 23:26:54 +0200, Thomas Petazzoni wrote:
> 
> > If there is no interest shown in a given patch, either by the
> > original
> > contributor or by another Buildroot developer within the two weeks
> > time, I'll mark the patch as "Rejected" due to the lack of
> > interest.
> > I'm sending this e-mail on June 1st, so on June 15th, for the
> > patches
> > that have not seen any discussion or activity, I'll mark them as
> > Rejected.
> 
> We are on June 15th.
> 
> > Here is the list of week #22 :
> > 
> > ?1/ package/libgpg-error: bump to version 1.21
> > ????http://patchwork.ozlabs.org/patch/562100/
> > 
> > ????I don't really have any comments, other than the fact that it
> > is
> > ????super annoying for a package with so many dependencies to start
> > ????having architecture dependencies. Could someone refresh and
> > ????validate this patch?
> 
> I'm keeping this one around, since we really want to bump libgpg-
> error
> at some point.

Sorry for not taking part in the discussion yet! I suggest to put some
effort to find an upstreamable solution. As Yann has noted I did a
proposal to remove the architecture dependency. However, I do not
understand the concern of the maintainer about ABI compliance. There
was no reaction to my last mail whereupon I stopped working on this
issue for now.

Anyone else interested in helping to solve this issue?

Best regards
J?rg Krause
