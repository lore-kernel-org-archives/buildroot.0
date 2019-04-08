From: Anisse Astier <anisse@astier.eu>
Date: Mon, 8 Apr 2019 13:25:04 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <20190408090458.49e1e5cc@windsurf>
References: <20180727024720.13370-1-camh@xdna.net> <20190407214941.GA3117@jaya>
 <87pnpxfe8b.fsf@paral.in> <20190408090458.49e1e5cc@windsurf>
Message-ID: <20190408112504.f245wq6rnlnl5i4x@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 08, 2019 at 09:04:58AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 07 Apr 2019 19:00:20 -0700
> Christian Stewart <christian@paral.in> wrote:
> 
> > > I don't know in which context it might be useful in buildroot.  
> > 
> > I don't see a reason for it either.
> 
> Thanks for the feedback, I'll mark the patch as Rejected for now. We
> can of course revisit if there's some further details about why this
> would be needed.

Agreed, thanks.

> 
> Anisse, Christian: nobody is listed in the DEVELOPERS file for the
> package/pkg-golang.mk file. Would you be willing to be listed as
> DEVELOPERS for this file ? It would be useful as you would be Cc'ed on
> patches touching this file, which would help in situations like this
> one. If you're fine with this, send a patch to add yourself :)

Good catch, I was wondering why I didn't see the previous emails. I'll
send a patch to add myself and add better email filtering on my side.

Regards,

Anisse
