From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 18:23:42 +0200
Subject: [Buildroot] [PATCH v8] package/canfestival: new package
In-Reply-To: <1412027000-15481-2-git-send-email-s.martin49@gmail.com>
References: <1412027000-15481-1-git-send-email-s.martin49@gmail.com>
 <1412027000-15481-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20141006182342.77360f5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 29 Sep 2014 23:43:20 +0200, Samuel Martin wrote:
> Note: the patch adding the pkgconfig module has been sent upstream [1].
> 
> [1] http://sourceforge.net/p/canfestival/mailman/message/32876320/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Eric Jarrige <eric.jarrige@armadeus.org>
> Cc: Julien Boibessot <julien.boibessot@armadeus.com>
> Cc: Davide Viti <zinosat@tiscali.it>
> Cc: Claudio Laurita <claudio.laurita@integrazionetotale.it>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks, applied, after doing a few changes:

    [Thomas:
     - license seems to be only LGPLv2.1+. At least, the specific files
       pointed to be GPLv2 carry a LGPLv2.1+ header.
     - added thread dependency
     - minor rewording here and there.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
