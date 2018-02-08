From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 8 Feb 2018 14:22:16 +0100
Subject: [Buildroot] [PATCH 1/1] udftools: new package
In-Reply-To: <20180206170806.1ffc1c28@windsurf>
References: <20180122213138.11855-1-skenton@ou.edu>
 <20180206170806.1ffc1c28@windsurf>
Message-ID: <20180208132216.GC2860@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 06, 2018 at 05:08:06PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 22 Jan 2018 15:31:38 -0600, Steve Kenton wrote:
> > Signed-off-by: Steve Kenton <skenton@ou.edu>
> > ---
> > Try 2: fix stupid copy paste error in Config.in
> > Try 3: remove duplicate/misplaced addition to master Config.in
> > I wish I could see these issues  when I first look the patch over - sigh
> > Try 4: Fixes for feedback from Thomas
> > I computed the hash below for the license file but I did not see any others under the package directory
> > so I think I must be misunderstanding where it should go from my reading of the on-line manual
> > # Locally computed
> > sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
> > I ran ./utils/check-package package/udftools/* and fixed up all the white space errors
> > But I'm not sure what to do with ./utils/test-pkg, do I need to build all 47 tools chains?
> > I tried ./utils/test-pkg -p udftools -c udftools.snippet (contents below) but just got errors
> > BR2_PACKAGE_UDFTOOLS=y
> 
> I've added a hash for the license file, and applied to next. Thanks!

I think the license should be "GPL-2.0" ?

> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Best regards
Marcus Folkesson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180208/878c4a78/attachment.asc>
