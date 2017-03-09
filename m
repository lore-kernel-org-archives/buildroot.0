From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 23:33:29 +0100
Subject: [Buildroot] [Patch v3 7/9] s6-portable-utils: new package
In-Reply-To: <1482182955-23916-8-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-8-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170309233329.09cc953b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Dec 2016 22:29:13 +0100, Eric Le Bihan wrote:
> This new package provides s6-portable-utils, a set of tiny general Unix
> utilities, often performing well-known tasks such as cut and grep, but
> optimized for simplicity and small size.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in                                |  1 +
>  package/s6-portable-utils/Config.in              | 11 ++++++++
>  package/s6-portable-utils/s6-portable-utils.hash |  2 ++
>  package/s6-portable-utils/s6-portable-utils.mk   | 34 ++++++++++++++++++++++++
>  4 files changed, 48 insertions(+)
>  create mode 100644 package/s6-portable-utils/Config.in
>  create mode 100644 package/s6-portable-utils/s6-portable-utils.hash
>  create mode 100644 package/s6-portable-utils/s6-portable-utils.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
