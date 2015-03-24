From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 00:33:24 +0100
Subject: [Buildroot] [PATCH v3] package/libxml2: add optional LZMA
 support
In-Reply-To: <1427235587-18228-1-git-send-email-yann.morin.1998@free.fr>
References: <1427235587-18228-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150325003324.29c1d913@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 24 Mar 2015 23:19:47 +0100, Yann E. MORIN wrote:
> LZMA support is provided by xz, since liblzma is long dead.
> 
> Contrary to zlib, liblzma uses pkg-config, so we do not need to add the
> full path to libzma.
> 
> Reported-by: vdm on IRC
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
