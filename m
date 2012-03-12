From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Mon, 12 Mar 2012 17:15:15 -0200
Subject: [Buildroot] [PATCHv2 1/1] vlc: New package
In-Reply-To: <201203111408.28171.arnout@mind.be>
References: <1330923026-1917-1-git-send-email-ismael.luceno@gmail.com>
 <1330923026-1917-2-git-send-email-ismael.luceno@gmail.com>
 <201203111408.28171.arnout@mind.be>
Message-ID: <20120312171515.3eadccce@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Mar 2012 14:08:27 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:
<...>
>  Is armv7-a the only architecture with Neon support?

Good question... also, I think nVidia ones don't have :/.

>  More generally, maybe we should have an architecture symbol for neon
> on which this type of package can rely.

+1

<...>
>  Why do the normal configure commands not work?
> 
>  The revision.txt could be done in POST_PATCH_HOOKS.
> 
>  The bootstrap can be done in PRE_CONFIGURE_HOOKS.  However, isn't vlc
> distributed with a configure script?  So the bootstrap will never be
> executed, right?

It's for scm versions, which I use from time to time. It doesn't hurt
to have, that's why I left it.

<...>
>  The configure arguments can be added to VLC_CONF_OPTS.
> 
>  The vasprintf can be done in POST_CONFIGURE_HOOKS.
> 
>  For all of these, there should be a comment explaining why it is
> needed. This will help later for version bumpers to remove it again,
> when it is no longer needed because of upstream updates.


Thanks for the comments! :D. I'll submit another version soon.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120312/dc82713e/attachment.asc>
