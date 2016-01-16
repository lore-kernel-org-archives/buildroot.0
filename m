From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 14:04:47 +0100
Subject: [Buildroot] [PATCH v2] linux-fusion: fix several build issues
In-Reply-To: <56991A50.5030808@free.fr>
References: <56951746.4070806@free.fr>
 <20160112174251.7280fdf3@free-electrons.com>
 <56957C2D.4060901@free.fr>
 <20160113092306.6e57b621@free-electrons.com>
 <56991A50.5030808@free.fr>
Message-ID: <20160116140447.3b93f052@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mason,

On Fri, 15 Jan 2016 17:12:00 +0100, Mason wrote:
> From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> 
> The first patch merely fixes a warning. The other two are required
> to use the module on Linux 4.x
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  .../0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch     | 29 ++++++++++
>  .../0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch          | 38 +++++++++++++
>  package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch       | 99 +++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
