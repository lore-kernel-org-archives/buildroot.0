From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Mon, 30 Jul 2007 21:46:36 +0200 (CEST)
Subject: [Buildroot] [patch] --includedir=/include ->
	--includedir=/usr/include
In-Reply-To: <0707302132400.17391@somehost>
References: <0707302132400.17391@somehost>
Message-ID: <0707302144150.17391@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Jul 2007, Cristian Ionescu-Idbohrn wrote:

> This should go on top of the previous patch. See:
>
> > Subject: Re: [patch] $(STAGING_DIR)/include -> $(STAGING_DIR)/usr/include
>
> > On Mon, 30 Jul 2007, Cristian Ionescu-Idbohrn wrote:
> >
> > > Whitespace-cleanup too.
> > > --includedir=/include -> --includedir=/usr/include and similar with
> > > $(STAGING_DIR) mixed in there.

My brain is catching up with my fingers :)
Here comes the patch too.


Cheers,

-- 
Cristian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br.mk2.patch
Type: text/x-diff
Size: 7599 bytes
Desc: 
Url : http://busybox.net/lists/buildroot/attachments/20070730/53a46d11/attachment.bin 
