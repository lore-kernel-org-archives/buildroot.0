From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 22:36:17 +0200
Subject: [Buildroot] [PATCH 1/2 v2] core/legal-info: properly check
 hashes of license files for host packages
In-Reply-To: <4352c0f979c2c09211f80092d881ff84b1df1368.1500225742.git.yann.morin.1998@free.fr>
References: <cover.1500225742.git.yann.morin.1998@free.fr>
 <4352c0f979c2c09211f80092d881ff84b1df1368.1500225742.git.yann.morin.1998@free.fr>
Message-ID: <20170729223617.2bab655b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Jul 2017 19:22:38 +0200, Yann E. MORIN wrote:
> When called for a host package, we currently miss the hash file, because
> it is named after the target package.
> 
> Fix that by using the package raw-name.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
