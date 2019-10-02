From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 02 Oct 2019 20:11:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: fix build with cmake < 3.10
References: <20191002175120.9238-1-fontaine.fabrice@gmail.com>
Message-ID: <mr5f6gxp7q.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 02 Oct 2019 19:51:20 +0200 schrieb Fabrice Fontaine:

> +# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to

Hi,

good catch, the old cmake version was the reason why I could not 
reproduce the error here (cmake version 3.13.4).

Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd
