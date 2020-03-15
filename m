From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:37:57 +0100
Subject: [Buildroot] [PATCH v1 2/4] package/qt5: enable for xtensa
In-Reply-To: <20200310081902.3488-2-ps.report@gmx.net>
References: <20200310081902.3488-1-ps.report@gmx.net>
 <20200310081902.3488-2-ps.report@gmx.net>
Message-ID: <20200315233757.47d51e50@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 09:19:00 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Add upstream patch to fix double-conversion compile for xtensa
> and drop dependency on !BR_xtensa.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/Config.in                         |  4 +--
>  ...-double-conversion-enable-for-xtensa.patch | 27 +++++++++++++++++++
>  2 files changed, 29 insertions(+), 2 deletions(-)
>  create mode 100644 package/qt5/qt5base/0004-double-conversion-enable-for-xtensa.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
