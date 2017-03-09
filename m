From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 23:08:30 +0100
Subject: [Buildroot] [Patch v3 4/9] s6-dns: new package
In-Reply-To: <1482182955-23916-5-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-5-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170309230830.4537c5c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Dec 2016 22:29:10 +0100, Eric Le Bihan wrote:
> This new package provides s6-dns, a suite of DNS client programs and
> libraries for Unix systems, as an alternative to the BIND, djbdns or
> other DNS clients.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in          |  1 +
>  package/s6-dns/Config.in   |  9 +++++++++
>  package/s6-dns/s6-dns.hash |  2 ++
>  package/s6-dns/s6-dns.mk   | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 57 insertions(+)
>  create mode 100644 package/s6-dns/Config.in
>  create mode 100644 package/s6-dns/s6-dns.hash
>  create mode 100644 package/s6-dns/s6-dns.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
