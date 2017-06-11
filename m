From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:01:49 +0200
Subject: [Buildroot] [PATCH v3 1/6] gdb: introduce
 BR2_PACKAGE_GDB_ARCH_SUPPORTS
In-Reply-To: <1497015115-8740-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1497015115-8740-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170611180149.74119851@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Jun 2017 15:31:50 +0200, Thomas Petazzoni wrote:
> Before adding more architecture dependencies to gdb, let's introduce a
> BR2_PACKAGE_GDB_ARCH_SUPPORTS, to avoid duplicating this list of
> dependencies between the Config.in comment and the main Config.in
> option.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v2:
>  - None
> Changes since v1:
>  - None
> ---
>  package/gdb/Config.in | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Series applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
