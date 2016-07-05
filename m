From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:59:42 +0200
Subject: [Buildroot] [PATCH 10/24 v2] package/perl: use dummy hostname
In-Reply-To: <9303aacab6fc99c113c9ca742beae73abbab47c6.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <9303aacab6fc99c113c9ca742beae73abbab47c6.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <20160705155942.7247fad0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 21:07:32 +0200, Yann E. MORIN wrote:
> The hostname does not look like it serves any useful purpose, except
> maybe to set set perladmin email.
> 
> Which is undoubtfully useless on the target.
> 
> A followup commit will make the hostname depend on the default skeleton,
> so it won't always be available. We can not rely on it to be set.
> 
> Besides, even today it is not guaranteed to be set; a user may well
> leave it empty.
> 
> Use a dummy hostname.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/perl/perl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
