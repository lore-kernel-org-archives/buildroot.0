From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 23:30:56 +0200
Subject: [Buildroot] [PATCH v3 4/9] package/libyang: add package
In-Reply-To: <20191011124131.28246-5-heiko.thiery@gmail.com>
References: <20191011124131.28246-1-heiko.thiery@gmail.com>
 <20191011124131.28246-5-heiko.thiery@gmail.com>
Message-ID: <20191022233056.7329ccb9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Oct 2019 14:40:42 +0200
heiko.thiery at gmail.com wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> LibYANG processes YIN and YANG files. It's a dependency of sysrepo which
> is a dependency of Netopeer, a NETCONF/YANG server.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> ---
>  DEVELOPERS                   |  3 +++
>  package/Config.in            |  1 +
>  package/libyang/Config.in    | 13 +++++++++++++
>  package/libyang/libyang.hash |  2 ++
>  package/libyang/libyang.mk   | 25 +++++++++++++++++++++++++
>  5 files changed, 44 insertions(+)
>  create mode 100644 package/libyang/Config.in
>  create mode 100644 package/libyang/libyang.hash
>  create mode 100644 package/libyang/libyang.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
