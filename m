From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Dec 2019 20:46:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5virtualkeyboard: add an
 upstream URL to Config.in
In-Reply-To: <20191217141058.27335-1-mark@dibsco.co.uk>
References: <20191217141058.27335-1-mark@dibsco.co.uk>
Message-ID: <20191217204630.5e25340a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

On Tue, 17 Dec 2019 14:10:58 +0000, Mark Corbin <mark@dibsco.co.uk> wrote:

> Add an upstream URL to the help text in Config.in. This
> addresses the 'Missing' URL status in the package stats
> web page output.
>
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/qt5/qt5virtualkeyboard/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
> index 3a60c27332..8e9cacd3c8 100644
> --- a/package/qt5/qt5virtualkeyboard/Config.in
> +++ b/package/qt5/qt5virtualkeyboard/Config.in
> @@ -14,6 +14,8 @@ config BR2_PACKAGE_QT5VIRTUALKEYBOARD
>  	  consists of a C++ backend supporting custom input methods as
>  	  well as a UI frontend implemented in QML.
>
> +	  https://doc.qt.io/qt-5/qtvirtualkeyboard-index.html
> +
>  if BR2_PACKAGE_QT5VIRTUALKEYBOARD
>
>  config BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
