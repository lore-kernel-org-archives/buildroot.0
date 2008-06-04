From: Arun Reddy <reddyac@gmail.com>
Date: Wed, 4 Jun 2008 15:26:58 -0700
Subject: [Buildroot] How does an offline build work?
In-Reply-To: <20080604212659.GG27768@mx.loc>
References: <326f33790806041344p65f55e31i3e9a507ef1176a72@mail.gmail.com>
	<20080604212659.GG27768@mx.loc>
Message-ID: <326f33790806041526j608ff657p4f6dad578820b497@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for the explanations. Looks like a snapshot will remain as it is
which is good news.

On Wed, Jun 4, 2008 at 2:26 PM, Bernhard Fischer <rep.dot.nop@gmail.com>
wrote:

> On Wed, Jun 04, 2008 at 01:44:56PM -0700, Arun Reddy wrote:
>
> >I am now using Subversion access so I can update the source tree whenever
> I
> >want, but if I were to go back to using the Buildroot snapshot image, will
> >doing an offline build "make source" allow me to do a build without
> >Buildroot being updated?
>
> offline has nothing to do with this.
>
> >                         Or is it just a way for all the files, packages,
> >etc, to be downloaded first so that I can continue the build in a place
> >where I do not have network access?
>
> yes.
>
> >Could someone clarify this? The Buildroot documentation doesn't have a
> >detailed explanation on how the offline build is supposed to work. Thank
> >you!
>
> It may not be detailed but answers all you asked above.
> $ make help
>
> and read everything (at least below "Miscellaneous:"). Twice. :)
> And then, right in the mentioned README the above is documentend
> extensively.
>
> HTH,
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080604/c03a2467/attachment.htm 
