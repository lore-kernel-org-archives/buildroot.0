From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:20:07 +0100
Subject: [Buildroot] [PATCH v3 2/2] qt53d: enabled assimpsceneparser
 plugin
In-Reply-To: <1450390699-10377-2-git-send-email-ps.report@gmx.net>
References: <1450390699-10377-1-git-send-email-ps.report@gmx.net>
 <1450390699-10377-2-git-send-email-ps.report@gmx.net>
Message-ID: <20151217232007.37a58df7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 17 Dec 2015 23:18:19 +0100, Peter Seiderer wrote:

> diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
> index d350922..6c09358 100644
> --- a/package/qt5/qt53d/Config.in
> +++ b/package/qt5/qt53d/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_QT53D
>  	bool "qt53d"
> +	select BR2_PACKAGE_ASSIMP

Is it really a mandatory dependency? If so, how could the original
qt53d package have been submitted without it?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
