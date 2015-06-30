From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 16:39:46 +0200
Subject: [Buildroot] [PATCH v7 19/22] libsemanage: cleanup python use
 and license definition
In-Reply-To: <1433251718-3167-20-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-20-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150630163946.10cd746c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue,  2 Jun 2015 08:28:35 -0500, Clayton Shotwell wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> The original package supported python on target, now we just use
> it as part of the host tools.  The license was also mis-assigned.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> Changes v6 -> v7:
>   - No changes

I've applied this patch. However, it was lacking an addition in
Config.in.legacy to handle the removal of the
BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS option.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
