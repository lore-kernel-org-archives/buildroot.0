From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 18:05:02 +0100
Subject: [Buildroot] [PATCH] package/libgta: new package
In-Reply-To: <20171226211006.9660-1-romain.naour@gmail.com>
References: <20171226211006.9660-1-romain.naour@gmail.com>
Message-ID: <20171231180502.054d257c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Dec 2017 22:10:06 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Package tested with test-pkg and checked with check-package.
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/libgta/Config.in   | 10 ++++++++++
>  package/libgta/libgta.hash |  3 +++
>  package/libgta/libgta.mk   | 29 +++++++++++++++++++++++++++++
>  5 files changed, 44 insertions(+)
>  create mode 100644 package/libgta/Config.in
>  create mode 100644 package/libgta/libgta.hash
>  create mode 100644 package/libgta/libgta.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
