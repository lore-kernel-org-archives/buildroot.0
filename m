From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 23:03:07 +0200
Subject: [Buildroot] [PATCH v8 10/10] package/qt5base: provide "qt.conf"
 to make "qmake" relocatable
In-Reply-To: <1500561321-6623-11-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-11-git-send-email-wg@grandegger.com>
Message-ID: <20170720230307.30c89094@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 16:35:21 +0200, Wolfgang Grandegger wrote:
> The file "qt.conf" can be used to override the hard-coded paths that
> are compiled into the Qt library. This is required to make "qmake"
> relocatable. Actually, we need to specify all variables to overwrite
> the compiled in values.
> 
> CC: Julien Corjon <corjon.j@ecagroup.com>
> CC: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  package/qt5/qt5base/qt.conf.in | 19 +++++++++++++++++++
>  package/qt5/qt5base/qt5base.mk |  8 ++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 package/qt5/qt5base/qt.conf.in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
