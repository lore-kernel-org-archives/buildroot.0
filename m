From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 15:50:04 +0200
Subject: [Buildroot] [PATCH 05/13 v7] core/legal-info: add package
 version to license directory
In-Reply-To: <5e1963c6feb57cd7a5096d296b86624f14bf3d8d.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <5e1963c6feb57cd7a5096d296b86624f14bf3d8d.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <20160624155004.2b6ace4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 18:14:30 +0200, Yann E. MORIN wrote:
> Now that we save the source archives in a directory named after the
> package and its version, do the same for the license files, for
> consistency.
> 
> It has a not-so-bad side-effect of also saving the version string in
> the all-licenses list.
> 
> The only (small) side-effect, is that the warnings about undefined
> _LICENSE_FILES now contains the version string, too. That's unavoidable,
> since that's what is stored in the legal report.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Chages v5 -> v6:
>   - raw name variable was renamed  (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
