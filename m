From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 13 Feb 2018 09:44:04 +0100
Subject: [Buildroot] [PATCH 08/14] diffconfig: fix code style
In-Reply-To: <20180213084930.07104f73@windsurf.lan>
References: <20180130202512.GA7723@gmail.com>
 <5a825820cac23_51963fbb9c9c7128471b1@ultri3.mail>
 <20180213084930.07104f73@windsurf.lan>
Message-ID: <20180213084404.GA2455@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Feb 13, 2018 at 08:49:30AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 13 Feb 2018 01:14:40 -0200, Ricardo Martincoski wrote:
> 
> > Adding this line to .flake8
> > exclude=utils/diffconfig
> > 
> > It looks to me the later is preferable. This way a script that don't need any
> > tweak can be a raw copy from the original.
> 
> Agreed, the latter seems preferable to me.

Yes, please do that.

Could you please add utils/config as well?

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com


Thank you,
Marcus Folkesson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180213/fd3d44c0/attachment.asc>
