From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 23:22:38 +0100
Subject: [Buildroot] [PATCH v5 1/2] package/unscd: new package
In-Reply-To: <565CCAEE.7070503@mind.be>
References: <1448287096-18606-1-git-send-email-rdkehn@yahoo.com>
 <1448287096-18606-2-git-send-email-rdkehn@yahoo.com>
 <20151130224457.4baa3ab6@free-electrons.com>
 <565CCAEE.7070503@mind.be>
Message-ID: <20151130232238.401bc727@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, 30 Nov 2015 23:17:18 +0100, Arnout Vandecappelle wrote:

> >>>> unscd 0.51 Patching
> > support/scripts/apply-patches.sh  /home/thomas/projets/buildroot/output/build/unscd-0.51 /home/thomas/projets/buildroot/output/build/unscd-0.51/debian/patches
> > Unsupported file type for /home/thomas/projets/buildroot/output/build/unscd-0.51/debian/patches/change_invalidate_request_info_output, skipping
> > Unsupported file type for /home/thomas/projets/buildroot/output/build/unscd-0.51/debian/patches/support_large_numbers_in_config, skipping
> 
>  Uh, that shouldn't happen, since 7caf464 everything in the series file should
> be applied regardless of name...

I tested on top of next, so it should have worked... but it did not. I
didn't check if the patches were actually applied, but it is clear that
this message was displayed, since I copy/pasted from my terminal.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
