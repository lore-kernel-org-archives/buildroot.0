From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 23:35:25 +0100
Subject: [Buildroot] [PATCH v4 2/2] docs/manual: document meson-based
 packages
In-Reply-To: <20171228222539.GH3428@scaer>
References: <20171029131052.18850-1-eric.le.bihan.dev@free.fr>
 <20171029131052.18850-3-eric.le.bihan.dev@free.fr>
 <20171228232210.5dda9865@windsurf> <20171228222539.GH3428@scaer>
Message-ID: <20171228233525.375fcbd2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Dec 2017 23:25:39 +0100, Yann E. MORIN wrote:

> IIRC, I made the same comment in a  previous iteration of this patch, and
> yes, meson really insists on having an empty build directory, otherwise it
> fails loudly... :-/
> 
> This should have been part of the commit log *and* should be clearly
> stated in the manual that this is required.

Follow-up patches welcome :-)

meson support has been sitting in patchwork for a while, and nobody
made this comment. It was time to apply it, and it is always time to
apply follow-up patches :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
