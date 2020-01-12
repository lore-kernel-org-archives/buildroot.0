From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 23:19:49 +0100
Subject: [Buildroot] [PATCH] package/thermald: new package
In-Reply-To: <20191231031255.15587-1-ricardo.martincoski@gmail.com>
References: <20191231031255.15587-1-ricardo.martincoski@gmail.com>
Message-ID: <20200112231949.671680c4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Dec 2019 00:12:55 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> From: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> 
> Thermal Daemon is a Linux daemon for monitoring and controlling platform
> temperatures.
> 
> ./utils/test-pkg --package thermald --all
> 44 builds, 39 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/thermald/Config.in     | 23 +++++++++++++++++++++++
>  package/thermald/thermald.hash |  5 +++++
>  package/thermald/thermald.mk   | 21 +++++++++++++++++++++
>  5 files changed, 51 insertions(+)
>  create mode 100644 package/thermald/Config.in
>  create mode 100644 package/thermald/thermald.hash
>  create mode 100644 package/thermald/thermald.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
