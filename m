From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 23:17:01 +0100
Subject: [Buildroot] [Patch v3 5/9] s6-networking: new package
In-Reply-To: <1482182955-23916-6-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-6-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170309231701.6df3f7b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Dec 2016 22:29:11 +0100, Eric Le Bihan wrote:
> This new package provides s6-networking, a suite of small networking
> utilities for Unix systems.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in                        |  1 +
>  package/s6-networking/Config.in          | 12 ++++++++
>  package/s6-networking/s6-networking.hash |  2 ++
>  package/s6-networking/s6-networking.mk   | 48 ++++++++++++++++++++++++++++++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 package/s6-networking/Config.in
>  create mode 100644 package/s6-networking/s6-networking.hash
>  create mode 100644 package/s6-networking/s6-networking.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
