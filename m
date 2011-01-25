From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 09:36:13 +0100
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <201101241648.15991.vapier@gentoo.org>
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
	<201101231607.30938.vapier@gentoo.org>
	<20110124171642.6cff75a4@surf>
	<201101241648.15991.vapier@gentoo.org>
Message-ID: <20110125093613.7b538d5b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Jan 2011 16:48:15 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> yes, that would make it work, but that just makes me want to cry.  it makes a 
> lot more sense imo to have $(PKG)_MAKE_OPT be passed for all steps (and 
> grepping the tree doesnt show any cases where this would be a problem).  if 
> people still want a hook specific to the build step, then it'd make sense to 
> add $(PKG)_BUILD_OPT or something similiar.

Yes, this makes sense.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110125/60578555/attachment.asc>
