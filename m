From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 15:57:30 +0100
Subject: [Buildroot] [PATCH 4/5] libevent: Remove hash file
In-Reply-To: <7e828df5dc012e40da5859ccb59fbe600a9899c0.1414941796.git.yann.morin.1998@free.fr>
References: <cover.1414941796.git.yann.morin.1998@free.fr>
 <7e828df5dc012e40da5859ccb59fbe600a9899c0.1414941796.git.yann.morin.1998@free.fr>
Message-ID: <20150203155730.7ebc3188@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  2 Nov 2014 16:25:56 +0100, Yann E. MORIN wrote:
> From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> Since the tarball we download is generated from GitHub, there's no
> saying that the tarball won't differ in a month from now.
> So the hash has no value there.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

This patch was marked as Rejected because we've switched back to using
a tarball from sourceforge for libevent instead of github.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
