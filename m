From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 2 May 2017 23:50:39 +0200
Subject: [Buildroot] [PATCH] package/libloki: new package
In-Reply-To: <1493758169-18291-1-git-send-email-corentin.guillevic@smile.fr>
References: <1493758169-18291-1-git-send-email-corentin.guillevic@smile.fr>
Message-ID: <e7358348-1adc-0743-63ac-f9d6e7c0cf70@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Corentin, All

Le 02/05/2017 ? 22:49, Corentin GUILLEVIC a ?crit :
> A C++ library of designs, containing flexible implementations of common design patterns and idioms.
> 
> Signed-off-by: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  DEVELOPERS                   |  3 +++
>  package/Config.in            |  1 +
>  package/libloki/Config.in    | 12 ++++++++++++
>  package/libloki/libloki.hash |  5 +++++
>  package/libloki/libloki.mk   | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 65 insertions(+)
>  create mode 100644 package/libloki/Config.in
>  create mode 100644 package/libloki/libloki.hash
>  create mode 100644 package/libloki/libloki.mk
> 

Two patches are missing here to fix the install step.

Corentin, care to send an updated patch?

Thanks!

Best regards,
Romain
