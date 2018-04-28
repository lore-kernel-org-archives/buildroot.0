From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 23:39:20 +0200
Subject: [Buildroot] [PATCH] libpciaccess: add dependency on hwdata
In-Reply-To: <606784904.1290653.1522719519542.JavaMail.zimbra@datacom.ind.br>
References: <20180128235233.26989-1-casantos@datacom.ind.br>
 <87zi2r7zaa.fsf@dell.be.48ers.dk>
 <1751033060.982024.1522341719017.JavaMail.zimbra@datacom.ind.br>
 <20180329175202.GA23440@scaer> <87efk28zyf.fsf@dell.be.48ers.dk>
 <606784904.1290653.1522719519542.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20180428233920.12c08b5b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 2 Apr 2018 22:38:39 -0300 (BRT), Carlos Santos wrote:

> > In the general case for nice-to-have-but-not-absolutely-required
> > dependencies we don't have a solution in Buildroot today except for a
> > note in the help text. Upstream kconfig has recently added the imply
> > keyword which could be used to implement this, but we would need to sync
> > our kconfig with upstream for that.  
> 
> OK, I will move the selection o hwdata to libvirt in the next version
> of the path series.

I don't know where we stand with the libvirt packaging, but following
this feedback, I marked this patch as Rejected in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
