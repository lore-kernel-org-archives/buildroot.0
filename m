From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 16:39:36 +0200
Subject: [Buildroot] [PATCH v3 2/4] package/ti-sgx-um: new package
In-Reply-To: <1468497888-6464-2-git-send-email-lothar.felten@gmail.com>
References: <1468497888-6464-1-git-send-email-lothar.felten@gmail.com>
 <1468497888-6464-2-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160716163936.55380669@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 14:04:46 +0200, Lothar Felten wrote:
> This package adds the userspace libraries for the SGX graphics accelerator of
> the following Texas Instruments SoCs: AM335x, AM437x, AM4430, AM5430
> It also adds a config file for the libraries and a System-V init script.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/ti-sgx-um/Config.in      | 29 +++++++++++++++++++++++++++++
>  package/ti-sgx-um/S80ti-sgx      | 14 ++++++++++++++
>  package/ti-sgx-um/powervr.ini    |  6 ++++++
>  package/ti-sgx-um/ti-sgx-um.hash |  2 ++
>  package/ti-sgx-um/ti-sgx-um.mk   | 38 ++++++++++++++++++++++++++++++++++++++
>  6 files changed, 90 insertions(+)
>  create mode 100644 package/ti-sgx-um/Config.in
>  create mode 100644 package/ti-sgx-um/S80ti-sgx
>  create mode 100644 package/ti-sgx-um/powervr.ini
>  create mode 100644 package/ti-sgx-um/ti-sgx-um.hash
>  create mode 100644 package/ti-sgx-um/ti-sgx-um.mk

Applied, with the following changes:

    [Thomas:
     - Add Config.in comment about the ti-sgx-km dependency.
     - Add dependency on glibc since the package consists of pre-built
       libraries that can only work with glibc.
     - Add Config.in comment about thread and glibc dependencies
     - Use tabs for indentation everywhere.
     - Use git:// instead of http:// to clone, since http:// doesn't work.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
