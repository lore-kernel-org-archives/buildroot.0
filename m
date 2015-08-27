From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Aug 2015 20:24:54 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5multimedia: fix gstreamer1
 support
In-Reply-To: <1440693254-31854-1-git-send-email-benoit@wsystem.com>
References: <1440693254-31854-1-git-send-email-benoit@wsystem.com>
Message-ID: <20150827202454.7e402e35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Thu, 27 Aug 2015 18:34:14 +0200, Beno?t Th?baudeau wrote:
> Fix the missing gstreamer1 build dependencies, which could possibly
> prevent the configuration of qt5multimedia from detecting the supported
> gstreamer1 features.
> 
> Fix the missing gstreamer1 install rules, which resulted in the
> following runtime error:
> 
>     defaultServiceProvider::requestService(): no service found for - "org.qt-project.qt.mediaplayer"
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> ---
>  package/qt5/qt5multimedia/qt5multimedia.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
