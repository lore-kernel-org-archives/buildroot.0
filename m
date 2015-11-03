From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:49:46 +0100
Subject: [Buildroot] [PATCH 1/1] libtirpc: rpcgen is only built for host,
 don't install to target
In-Reply-To: <1446584983-29703-1-git-send-email-phil@zankapfel.net>
References: <1446584983-29703-1-git-send-email-phil@zankapfel.net>
Message-ID: <20151103234946.66dc809e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Phil Eichinger,

On Tue,  3 Nov 2015 22:09:43 +0100, Phil Eichinger wrote:
> rpcgen is only used to generate headers needed for compilation.
> Move it to noinst_PROGRAMS otherwise you may end up with a host-arch
> binary in your target.
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>  package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
