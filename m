From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 15 Mar 2014 08:14:02 +0100
Subject: [Buildroot] [PATCH v4] Added support for configuration of
	boost	binary names layout
In-Reply-To: <1394857672-512-1-git-send-email-uwe_kindler@web.de>
References: <1394857672-512-1-git-send-email-uwe_kindler@web.de>
Message-ID: <d7b48e88-0c45-48e1-97ec-00f53c81c16d@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uwe Kindler <uwe_kindler@web.de> schreef:
>
>Signed-off-by: Uwe Kindler <uwe_kindler@web.de>
>Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>---
>Changes v3 -> v4:
>  - moved config BR2_PACKAGE_BOOST_LAYOUT out of choice
>  
>Changes v2 -> v3:
>  - removed inconsistencies in Config.in help texts and fixed typos (suggested by Thomas De Schampheleire)
>
>Changes v1 -> v2:
>  -  handle "switch statement" in Config.in file via BR2_PACKAGE_BOOST_LAYOUT (suggested by Arnout Vandecappelle)
>
>---
> package/boost/Config.in |   34 ++++++++++++++++++++++++++++++++++
> package/boost/boost.mk  |    7 ++++---
> 2 files changed, 38 insertions(+), 3 deletions(-)



Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
