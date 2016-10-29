From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:59:29 +0200
Subject: [Buildroot] [PATCH v1] motion: fix static linking of mysql with
 enabled libz library
In-Reply-To: <1477424240-3672-1-git-send-email-ps.report@gmx.net>
References: <1477424240-3672-1-git-send-email-ps.report@gmx.net>
Message-ID: <20161029155929.6a762c93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 21:37:20 +0200, Peter Seiderer wrote:
> Fixes ([1]):
> 
>   checking for mysql_init in -lmysqlclient... no
>   configure: error: MySQL support can't build without MySQL libraries
> 
> [1] http://autobuild.buildroot.net/results/6cf/6cf38698a2a9a041ff375c01ae8898eace17cfb2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Checked with motion 3.4.1 and 4.0.1.
> ---
>  ...c-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch | 31 ++++++++++++++++++++++
>  package/motion/motion.mk                           |  6 ++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 package/motion/0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
