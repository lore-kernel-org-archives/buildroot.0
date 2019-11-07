From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 23:50:56 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/python-pyaes: new package
In-Reply-To: <20191107170504.1327891-1-b.bilas@grinn-global.com>
References: <20191107170504.1327891-1-b.bilas@grinn-global.com>
Message-ID: <20191107235056.66794faa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bartosz,

On Thu,  7 Nov 2019 18:05:03 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 33273ce6c8..e9f5345520 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -258,6 +258,7 @@ F:	package/orbit/
>  N:	Bartosz Bilas <b.bilas@grinn-global.com>
>  F:	package/qt5/qt5scxml/
>  F:	package/qt5/qt5webview/
> +F:	package/python-pyaes

Alphabetic ordering + needs a final /, to be like other entries.

Applied to next after fixing this minor issue. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
