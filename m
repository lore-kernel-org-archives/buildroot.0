From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:42:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/util-linux: add file optional
 dependency
In-Reply-To: <20201031220922.1557564-1-fontaine.fabrice@gmail.com>
References: <20201031220922.1557564-1-fontaine.fabrice@gmail.com>
Message-ID: <20201031234247.1e0f1307@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Oct 2020 23:09:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> file is an optional dependency of more binary and is enabled by default
> since version 2.36 and
> https://github.com/karelzak/util-linux/commit/09070e1a658e70ec203150e4fa5f486b32771858
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/util-linux/util-linux-libs/util-linux-libs.mk | 3 +++
>  package/util-linux/util-linux.mk                      | 8 ++++++++
>  2 files changed, 11 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
