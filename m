From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 10:05:39 +0100
Subject: [Buildroot] [PATCH v1] package/qt5/qt5scxml: needs
 qt5declarative package (fixes)
In-Reply-To: <20171227223641.8885-1-ps.report@gmx.net>
References: <20171227223641.8885-1-ps.report@gmx.net>
Message-ID: <20171228100539.335cc42b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Dec 2017 23:36:41 +0100, Peter Seiderer wrote:
> - add qt5declarative depends comment
> - add missing qt5declarative dependency
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5scxml/Config.in   | 2 +-
>  package/qt5/qt5scxml/qt5scxml.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master after slightly tweaking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
