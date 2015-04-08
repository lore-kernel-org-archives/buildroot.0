From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 19:14:14 +0200
Subject: [Buildroot] [PATCH v2 1/5] gcc-final: install libatomic
In-Reply-To: <1428511969-28430-2-git-send-email-gustavo@zacarias.com.ar>
References: <1428511969-28430-1-git-send-email-gustavo@zacarias.com.ar>
 <1428511969-28430-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150408191414.1fce04ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  8 Apr 2015 13:52:45 -0300, Gustavo Zacarias wrote:
> It's required in some 32-bit architectures for the extended (64-bit)
> atomic operations, like __sync_add_and_fetch_8.
> These arches are at least: i386, mips & mipsel.
> 
> Target size growth is ~15 KiB for ARM.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

What is your proposal to handle libatomic for the external toolchain
case?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
