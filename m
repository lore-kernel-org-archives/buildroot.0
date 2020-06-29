From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 22:46:31 +0200
Subject: [Buildroot] [PATCH 1/3] package/binutils: add version 2.34
In-Reply-To: <20200625121302.2286527-1-romain.naour@gmail.com>
References: <20200625121302.2286527-1-romain.naour@gmail.com>
Message-ID: <20200629224631.2ed07bda@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Jun 2020 14:13:00 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> From: Romain Naour <romain.naour@smile.fr>
> 
> Rebase existing patches.
> 
> Keep BR2_BINFMT_FLAT disabled for binutils 2.34 since elf2flt issue
> is not fixed [1] [2].

This is really going to be a problem soon: 2.32 is the last working
version. We need to fix that issue otherwise we'll have to drop support
for FLAT binaries :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
