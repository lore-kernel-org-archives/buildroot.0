From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:33:31 +0200
Subject: [Buildroot] [PATCH 1/1] qt5declarative: backport 'Fix alignment
 issue on ARMv7' patch to 5.9.1
In-Reply-To: <20170731171359.32471-1-petar.koretic@qaap.io>
References: <20170731171359.32471-1-petar.koretic@qaap.io>
Message-ID: <20170731193331.692187b7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 19:13:59 +0200, Petar Koretic wrote:
> This resolves a QML issues reported in
> https://bugreports.qt.io/browse/QTBUG-61522 that will be fixed in the 5.9.2.
> 
> Signed-off-by: Petar Koretic <petar.koretic@qaap.io>
> ---
>  .../0003-Fix-alignment-issue-on-ARMv7.patch        | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch
> 
> diff --git a/package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch b/package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch

Does this patch applies only to 5.9.1 ? If so, it should go in
package/qt5/qt5declarative/5.9.1/.

I can fixup the patch, just tell me if this issue is only applicable to
5.9.1 (I guess it is the case, but I prefer to ask).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
