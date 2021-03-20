From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:53:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 0.12.1
In-Reply-To: <20210317023021.1821721-1-james.hilliard1@gmail.com>
References: <20210317023021.1821721-1-james.hilliard1@gmail.com>
Message-ID: <20210320225355.45edd29b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Mar 2021 20:30:21 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch that is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...-t-require-optional-wheel-dependency.patch | 40 -------------------
>  .../python-setuptools-rust.hash               |  4 +-
>  .../python-setuptools-rust.mk                 |  4 +-
>  3 files changed, 4 insertions(+), 44 deletions(-)
>  delete mode 100644 package/python-setuptools-rust/0001-Don-t-require-optional-wheel-dependency.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
