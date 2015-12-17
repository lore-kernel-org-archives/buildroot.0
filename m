From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 21:50:29 +0100
Subject: [Buildroot] [PATCH 1/1] rabbitmq-c:new package
In-Reply-To: <1447843327-22577-1-git-send-email-joris.lijssens@gmail.com>
References: <1447843327-22577-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20151217215029.4256b85a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joris Lijssens,

On Wed, 18 Nov 2015 11:42:07 +0100, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/Config.in                  |  1 +
>  package/rabbitmq-c/Config.in       |  7 +++++++
>  package/rabbitmq-c/rabbitmq-c.hash |  2 ++
>  package/rabbitmq-c/rabbitmq-c.mk   | 29 +++++++++++++++++++++++++++++
>  4 files changed, 39 insertions(+)
>  create mode 100644 package/rabbitmq-c/Config.in
>  create mode 100644 package/rabbitmq-c/rabbitmq-c.hash
>  create mode 100644 package/rabbitmq-c/rabbitmq-c.mk

Applied, with some changes:

    [Thomas:
     - pass -DBUILD_TOOLS_DOCS=OFF in <pkg>_CONF_OPTS
     - use -DBUILD_SHARED_LIBS and -DBUILD_STATIC_LIBS to enable/disable
       the creation of shared/static libraries depending on the
       configuration.
     - remove trailing spaces.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
