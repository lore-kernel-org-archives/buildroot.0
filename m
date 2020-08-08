From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Aug 2020 00:16:00 +0200
Subject: [Buildroot] [PATCH v2 3/4] boot/optee-os: Depend on host-python3
In-Reply-To: <20200722071030.16128-4-hi@senzilla.io>
References: <20200722071030.16128-4-hi@senzilla.io>
Message-ID: <20200809001600.09398588@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 07:11:41 +0000
Dick Olsson <hi@senzilla.io> wrote:

> Recent versions of OP-TEE depend on Python 3. Currently, OP-TEE is building
> with the Python interpreter provided by the user. This patch includes an
> upstream patch that makes the interpreter configurable, and makes use of
> this configuration with host-python3.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> ---
>  ...e-ta-Configurable-Python-interpreter.patch | 249 ++++++++++++++++++
>  boot/optee-os/optee-os.mk                     |   5 +-
>  2 files changed, 252 insertions(+), 2 deletions(-)
>  create mode 100644 boot/optee-os/0003-mk-core-ta-Configurable-Python-interpreter.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
