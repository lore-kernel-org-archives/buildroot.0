From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 23:32:50 +0200
Subject: [Buildroot] [PATCH] supertux: select BR2_PACKAGE_LIBCURL
In-Reply-To: <20170418155153.52641-1-Vincent.Riera@imgtec.com>
References: <20170418155153.52641-1-Vincent.Riera@imgtec.com>
Message-ID: <20170430233250.7fe625ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Apr 2017 16:51:53 +0100, Vicente Olivert Riera wrote:
> libcurl is unconditionally added to the dependencies list in
> supertux.mk. However libcurl is not selected in Config.in.
> 
> This patch fixes that.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/supertux/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
