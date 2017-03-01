From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 21:55:31 +0100
Subject: [Buildroot] [PATCH 1/1] classpath: enable on sparc and sparc64.
In-Reply-To: <20170228201302.12168-1-m.hoffmann@cartelsol.com>
References: <20170228201302.12168-1-m.hoffmann@cartelsol.com>
Message-ID: <20170301215531.68e54e8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 21:13:02 +0100, Marcus Hoffmann wrote:
> GNU classpath builds fine on sparc and sparc64 architectures. So
> we allow building it there to be consistent with the naming of
> BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS.
> 
> Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
> ---
>  package/classpath/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
