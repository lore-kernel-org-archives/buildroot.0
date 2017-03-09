From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 23:08:24 +0100
Subject: [Buildroot] [Patch v3 3/9] s6: new package
In-Reply-To: <1482182955-23916-4-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-4-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170309230824.59fe02b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Dec 2016 22:29:09 +0100, Eric Le Bihan wrote:
> This new package provides s6, a small suite of programs for UNIX,
> designed to allow process supervision (a.k.a service supervision), in
> the line of daemontools and runit.
> 
> The host variant is provided as it is required to build the host
> variant of s6-rc. Only the libraries and headers are installed.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in    |  1 +
>  package/s6/Config.in | 10 ++++++++
>  package/s6/s6.hash   |  2 ++
>  package/s6/s6.mk     | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 83 insertions(+)
>  create mode 100644 package/s6/Config.in
>  create mode 100644 package/s6/s6.hash
>  create mode 100644 package/s6/s6.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
