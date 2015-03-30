From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 09:26:21 +0200
Subject: [Buildroot] [PATCH 05/35] pkg-generic: allow full URLs for
 <pkg>_EXTRA_DOWNLOADS
In-Reply-To: <20150329210831.GF4093@free.fr>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150329210831.GF4093@free.fr>
Message-ID: <20150330092621.46df4b0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 29 Mar 2015 23:08:31 +0200, Yann E. MORIN wrote:

> And here I was going to suggest you could squash the two together,
> because they're basically doing exactly the same thing, but on
> different sets. So I wondered why you did not catch this, even
> though you state it explicitly in the commit log.
> 
> It would have been just possible to extend the existing loop over
> _PATCH like so:
> 
>     $(foreach p,$($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS),\
> 
> And then, I noticed patch 33, which eventually gets rid of it anyway.
> So, OK.
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yes, exactly, a later patch refactors completely this part of the code.

I must admit that the organization of the patches may not be optimal,
but it's not easy to find a good split of things, while keeping patches
small and minimal.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
