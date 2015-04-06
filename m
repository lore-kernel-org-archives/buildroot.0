From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:21:57 +0200
Subject: [Buildroot] [buildroot-test] [PATCH] autbuild-run: fix
	legal-info
In-Reply-To: <1428354169-25215-1-git-send-email-yann.morin.1998@free.fr>
References: <1428354169-25215-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150406232157.4d71a397@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  6 Apr 2015 23:02:49 +0200, Yann E. MORIN wrote:
> Currently, running legal-info is broken, as it only runs a plain 'make',
> which does not do much...
> 
> Fix that by explicitly pass 'legal-info' as the make target. Also, we
> need to specify the download dir, to avoid using the default one (which
> does not exist) or a user-defined one (in the environment).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
