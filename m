From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 21:50:50 +0200
Subject: [Buildroot] [PATCH 1/9] package/lensfun: new package
In-Reply-To: <20170305151004.2815-1-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
Message-ID: <20170329215050.3454613f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Mar 2017 16:09:56 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/lensfun/Config.in    | 28 ++++++++++++++++++++++++++++
>  package/lensfun/lensfun.hash |  5 +++++
>  package/lensfun/lensfun.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 76 insertions(+)
>  create mode 100644 package/lensfun/Config.in
>  create mode 100644 package/lensfun/lensfun.hash
>  create mode 100644 package/lensfun/lensfun.mk

Applied to master, after fixing the missing select noticed by Baruch.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
