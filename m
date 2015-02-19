From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:26:08 +0100
Subject: [Buildroot] [PATCH 0/6] Build a Nios-II internal toolchain
In-Reply-To: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20150219222608.0b7cc308@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Tue, 17 Feb 2015 13:26:52 -0300, Ezequiel Garcia wrote:

> Ezequiel Garcia (6):
>   gcc: 4.9.2: Add patch to remove a wrong header
>   binutils: nios2: Prevent selecting unsupported versions
>   gcc: nios2: Prevent selecting unsupported versions
>   glibc: nios2: Prevent selecting unsupported versions
>   linux-headers: nios2: Prevent selecting unsupported versions
>   toolchain: Enable the internal toolchain for nios2

I did a test build, which went all fine and the patches look simple
enough. Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
