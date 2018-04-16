From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 17:46:48 +0200
Subject: [Buildroot] [PATCH 1/1] qt53d: Install missing QML modules,
 plugins and examples
In-Reply-To: <1523838643-10141-1-git-send-email-rom.reignier@gmail.com>
References: <1523838643-10141-1-git-send-email-rom.reignier@gmail.com>
Message-ID: <20180416174648.29f3b47d@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Apr 2018 02:30:43 +0200, Romain Reignier wrote:
> Some files were missing on the first build of qt53d but added later:
> - by qt5base for the plugins because it copies the whole /usr/lib/qt/plugins
>   directory
> - by qt5declarative for the QML modules because it copies the whole
>   /usr/qml directory
> 
> The qt53d examples were not installed if BR2_PACKAGE_QT5BASE_EXAMPLES was
> set
> 
> Signed-off-by: Romain Reignier <rom.reignier@gmail.com>
> ---
>  package/qt5/qt53d/qt53d.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
