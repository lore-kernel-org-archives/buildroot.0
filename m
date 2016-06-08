From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 14:07:35 +0200
Subject: [Buildroot] [PATCH v4] p7zip: New package
In-Reply-To: <1464731871-12355-1-git-send-email-nerv@dawncrow.de>
References: <1464731871-12355-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20160608140735.6869fc77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 May 2016 23:57:51 +0200, Andr? Hentschel wrote:
> Only enabled on a subset of known-working architectures.
> It fails to build on some archs, like blackfin.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/Config.in        |  1 +
>  package/p7zip/Config.in  | 16 ++++++++++++++++
>  package/p7zip/p7zip.hash |  3 +++
>  package/p7zip/p7zip.mk   | 27 +++++++++++++++++++++++++++
>  4 files changed, 47 insertions(+)
>  create mode 100644 package/p7zip/Config.in
>  create mode 100644 package/p7zip/p7zip.hash
>  create mode 100644 package/p7zip/p7zip.mk

Applied to master with the following changes:

    [Thomas:
     - Add comment about the Blackfin exception.
     - Propagate the Blackfin exception to the Config.in comment.
     - Fix the license, it is the LGPLv2.1+ *with* the unRAR restriction.
     - Use $(INSTALL) -D -m 0755 to install the binary instead of cp.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
