From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Sep 2014 09:35:59 +0200
Subject: [Buildroot] [PATCH] openssh: Add patch to fix compilation with
 musl libc
In-Reply-To: <1410493782-15542-1-git-send-email-maarten@treewalker.org>
References: <1410493782-15542-1-git-send-email-maarten@treewalker.org>
Message-ID: <20140912093559.52c06209@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Fri, 12 Sep 2014 05:49:42 +0200, Maarten ter Huurne wrote:

> The configure script finds the "howmany" macro, but some of the sources
> using it do not include the required <sys/param.h> header.
> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>  .../openssh/openssh-02-fix-howmany-include.patch   | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 package/openssh/openssh-02-fix-howmany-include.patch

Thanks. Missing description and SoB line in the patch. Also, could you
submit the patch upstream to OpenSSH ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
