From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 2 Jan 2016 01:16:14 -0500
Subject: [Buildroot] [PATCH 1/2 v4] vboot-utils: new package
In-Reply-To: <20151224192602.GA14377@vostro>
References: <20151224184333.GA7510@vostro> <20151224185516.GO25803@vapier.lan>
 <20151224192602.GA14377@vostro>
Message-ID: <20160102061614.GP25803@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 Dec 2015 21:26, Alex Suykov wrote:
> Thu, Dec 24, 2015 at 01:55:16PM -0500, Mike Frysinger wrote:
> 
> > this seems to have the same errors i pointed out in the ealier versions
> 
> (this message I think:
> http://lists.busybox.net/pipermail/buildroot/2015-December/146493.html )
> 
> "ChromiumOS" instead of "Chromium OS" in Config.host.in, overlooked that.
> This is going into v5 patch then.
> 
> As for the tarball issue, I don't think there are any better options.
> It's either that, or a git checkout.
> Do you mean it would be better to use git instead?

i mean git is the only option.  any hash you commit will be invalid for
any other user.  unless you download that tarball and host it on your own
site and list that as the source, but i think that's frowned upon.

run `wget` multiple times on the archive URI and you should get different
results every time.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160102/5f7442eb/attachment.asc>
