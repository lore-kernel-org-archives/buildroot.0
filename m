From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 22:33:16 +0200
Subject: [Buildroot] [PATCH v2] qt5quickcontrols2: new package
In-Reply-To: <1460151190-21021-1-git-send-email-ps.report@gmx.net>
References: <1460151190-21021-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160418223316.30792108@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Apr 2016 23:33:10 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - move menu entry to 'technology preview' section
>   - add QT5_GL_AVAILABLE/QT5_JSCORE_AVAILABLE dependency comment
>   - install the right qt5quickcontrols2 files to target
>     (all suggested by Julien Corjon)
> ---
>  package/qt5/Config.in                              |  2 ++
>  package/qt5/qt5quickcontrols2/Config.in            | 17 +++++++++
>  .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  2 ++
>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 40 ++++++++++++++++++++++
>  4 files changed, 61 insertions(+)
>  create mode 100644 package/qt5/qt5quickcontrols2/Config.in
>  create mode 100644 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
>  create mode 100644 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
