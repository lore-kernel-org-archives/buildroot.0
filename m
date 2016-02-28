From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 23:04:41 +0100
Subject: [Buildroot] [PATCH v3] pifmrds: add patch to correct linking in
 static build
In-Reply-To: <1456523757-16847-1-git-send-email-arnout@mind.be>
References: <1456475491-5098-1-git-send-email-limpens@gmail.com>
 <1456523757-16847-1-git-send-email-arnout@mind.be>
Message-ID: <20160228230441.0dd28ddd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Fri, 26 Feb 2016 22:55:57 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Eric Limpens <limpens@gmail.com>
> 
> This patch fixes an autobuild error during a static build:
> http://autobuild.buildroot.net/results/f61ae46ba4d4fc3af3784d1f612a8c1cc7de3314/
> 
> Signed-off-by: Eric Limpens <limpens@gmail.com>
> [Arnout: clean up commit message and patch log]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v3: clean up commit message and patch log [Arnout]
> ---
>  .../pifmrds/0003-Makefile-fix-static-link.patch    | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/pifmrds/0003-Makefile-fix-static-link.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
