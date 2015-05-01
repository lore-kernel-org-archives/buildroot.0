From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 10:17:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/celt051: Add patch to fix musl
 build
In-Reply-To: <1430421295-663-1-git-send-email-joerg.krause@embedded.rocks>
References: <1430421295-663-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150501101720.4a588e4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 30 Apr 2015 21:14:55 +0200, J?rg Krause wrote:
> musl does not define __GNUC_PREREQ. Use patch from Alpine Linux
> (http://git.alpinelinux.org/cgit/aports/plain/main/celt051/fix-gnuc-prereq.patch).
> 
> Fixes http://autobuild.buildroot.net/results/223/223ba6003bdd7e0c896455c21fa8fee943b4e716/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/celt051/0001-fix-gnuc-prereq.patch | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/celt051/0001-fix-gnuc-prereq.patch

Applied, thanks. Please try to submit the patch upstream if possible.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
