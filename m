From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 15 May 2018 16:59:41 +0200
Subject: [Buildroot] [PATCH 1/1] snort: fix build on sparc v8
In-Reply-To: <20180515144128.602fea19@windsurf>
References: <20180510111748.26293-1-fontaine.fabrice@gmail.com>
 <20180513214550.529cba8c@windsurf.home>
 <CANu7NGtFKmJdQoT_-ecuUyG3Apctxm-6u7kjiYPeHOqkbk-L2w@mail.gmail.com>
 <20180515144128.602fea19@windsurf>
Message-ID: <CAPi7W82SzgTdc+i20=pDWhgJA7qqTrrUu16BnEFeqONckzZ+vA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-05-15 14:41 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Mon, 14 May 2018 13:56:29 -0300, Sergio Prado wrote:
>
> > > However, I haven't been able to find an upstream Git repository for
> > > Snort, so I'm wondering how the existing Git-formatted patches have
> > > been generated. Perhaps from a repository created locally using git
> > > init+git add ?
> > >
> > > Sergio, since you added the snort package, how did you generate the
> > > patches ?
> >
> > Yes, I manually created the git repository to generate the patches.
>
> OK, that explains the Git-formatted patches, without any obvious
> upstream Git repository available online.
>
So, do you want to reformat my patch? What is the best practice, should we
always send git formatted patch even if there is no official Git
repository?

>
> > I have also sent the patches upstream and ping one time after a
> > month, but got no responses so far.
>
> OK, too bad. Is snort unmaintained ? Is upstream focused on this snort3
> project ?
>
Actually snort is most widely used than snort3. snort3 is still in alpha. I
have a patch for snort3 package but snort and snort3 don't use the same
version of daq library :-/

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180515/267fddff/attachment.html>
