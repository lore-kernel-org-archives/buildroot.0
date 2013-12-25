From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 18:16:13 +0100
Subject: [Buildroot] [PATCH] qt5: install headers into /usr/include/qt5
In-Reply-To: <1387868037-31734-1-git-send-email-fatih.asici@gmail.com>
References: <1387868037-31734-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <20131225181613.3bfa9b0f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Tue, 24 Dec 2013 08:53:57 +0200, Fatih A??c? wrote:
> There are places in Qt's source where headers included with the name of
> the module subdirectory (e.g. #include <QtCore/QHash>). Therefore, the
> build system passes the top header directory to the compiler; but this
> results in a error when building host tools since sysroot/usr/include
> directory includes architecture specific system headers.
> 
> In order to prevent this, install all Qt headers into a subdirectory in
> /usr/include.
> 
> Fixes: http://autobuild.buildroot.net/results/4f1/4f16c0b38bdd6e40efcc781c12fae81c0bfabb72/
> 
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
