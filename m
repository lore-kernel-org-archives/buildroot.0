From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:04:18 +0100
Subject: [Buildroot] [PATCH] qt5declarative: build and install examples
In-Reply-To: <20170316225425.26277-1-gael.portay@savoirfairelinux.com>
References: <20170316225425.26277-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170318150418.4a89d35f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Mar 2017 18:54:25 -0400, Ga?l PORTAY wrote:
> This patch builds and installs Qt examples for declarative module.
> 
> It proceeds the same way as others Qt5 modules. Samples are installed
> under /usr/lib/qt/examples/qml directory (/usr/lib/qt/examples/quick for
> quick).
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5declarative/qt5declarative.mk | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
