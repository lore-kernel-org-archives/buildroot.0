From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:09:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/python{3}-cryptography: bump to
 version 3.3.2
In-Reply-To: <20210708184444.3119773-1-james.hilliard1@gmail.com>
References: <20210708184444.3119773-1-james.hilliard1@gmail.com>
Message-ID: <20210717100934.4a8a8cc5@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu,  8 Jul 2021 12:44:44 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is the last version to support python2.
> 
> License hash change due to removal of OpenSSL locking reference:
> https://github.com/pyca/cryptography/commit/49109ce1a6e870cb6cc87f05d9ae7c03d70a684b
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cryptography/python-cryptography.hash | 6 +++---
>  package/python-cryptography/python-cryptography.mk   | 4 ++--
>  package/python3-cryptography/python3-cryptography.mk | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
