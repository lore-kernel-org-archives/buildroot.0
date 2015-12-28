From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 22:05:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/eigen: install .pc file
In-Reply-To: <6208cd9e3ec1e0da22459393104981ab0e43d69b.1451329553.git.yann.morin.1998@free.fr>
References: <cover.1451329553.git.yann.morin.1998@free.fr>
 <6208cd9e3ec1e0da22459393104981ab0e43d69b.1451329553.git.yann.morin.1998@free.fr>
Message-ID: <20151228220540.262dfc9c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 28 Dec 2015 20:08:54 +0100, Yann E. MORIN wrote:
> Other packages will look for eigen3.pc to detect the presence of eigen3.
> 
> eigen3.pc is usually installed by eigen's cmake buildsystem, but we do a
> manual install to not depend on host-cmake just to install header files.
> But in doing so, we forgot to install the .pc file.
> 
> Manually sed the source .pc.in to generate the final .pc file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/eigen/eigen.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied, thanks. Since I forgot to fix it in the commit, I did a
follow-up commit to fix the indentation. You used a mix of tabs and
spaces in a not very consistent way.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
