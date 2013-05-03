From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 May 2013 20:59:38 +0200
Subject: [Buildroot] [PATCH 1/3] sunxi-tools: new host/taget package
In-Reply-To: <1363289498-20993-1-git-send-email-carlo.caione@gmail.com>
References: <1363289498-20993-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <20130503205938.42d61eb7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlo Caione,

On Thu, 14 Mar 2013 20:31:36 +0100, Carlo Caione wrote:
> Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
> ---
>  package/Config.in                  |  1 +
>  package/Config.in.host             |  1 +
>  package/sunxi-tools/Config.in      |  8 ++++++++
>  package/sunxi-tools/Config.in.host |  9 ++++++++
>  package/sunxi-tools/sunxi-tools.mk | 42 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 61 insertions(+)
>  create mode 100644 package/sunxi-tools/Config.in
>  create mode 100644 package/sunxi-tools/Config.in.host
>  create mode 100644 package/sunxi-tools/sunxi-tools.mk

Do you think you'll have the time to rework your patch series about
Sunxi platform support? It would be great to have this in BR.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
