From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:10:27 +0100
Subject: [Buildroot] [PATCH 1/3] qt5: use a common option for
 JavaScriptCore dependencies
In-Reply-To: <1388396057-19042-1-git-send-email-fatih.asici@gmail.com>
References: <1388396057-19042-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <20131231001027.23f39004@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Mon, 30 Dec 2013 11:34:15 +0200, Fatih A??c? wrote:
> This will be used by other qt packages that contain a copy of
> JavaScriptCore.
> 
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  package/qt5/Config.in                     |  8 ++++++++
>  package/qt5/qt5declarative/Config.in      | 12 ++----------
>  package/qt5/qt5graphicaleffects/Config.in |  4 ++--
>  package/qt5/qt5multimedia/Config.in       |  4 ++--
>  package/qt5/qt5quick1/Config.in           |  4 ++--
>  package/qt5/qt5quickcontrols/Config.in    |  4 ++--
>  6 files changed, 18 insertions(+), 18 deletions(-)

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
