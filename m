From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 17:13:12 +0100
Subject: [Buildroot] [v3 0/2] openssl: parallel build
In-Reply-To: <20151123130528.GA3857@free.fr>
References: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
 <20151118135709.125f4afd@free-electrons.com>
 <20151123130528.GA3857@free.fr>
Message-ID: <20151123171312.20b1cf37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Nov 2015 14:05:28 +0100, Yann E. MORIN wrote:

> > Do you have some ideas? Does Gentoo has some more patches? Should we
> > revert back to non-parallel build for OpenSSL ?
> 
> I believe we should just revert the patch.
> 
> It's unfortunate that we can't buid OpenSSL in parallel, but we can't
> seriously go and patch their broken buildsystem, not at least until they
> are willing to review and apply those patches upstream first.

Agreed, we should revert the patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
