From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:06:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-bcrypt: bump to version
 3.2.0
In-Reply-To: <20210708230300.2578770-1-james.hilliard1@gmail.com>
References: <20210708230300.2578770-1-james.hilliard1@gmail.com>
Message-ID: <20210716230633.4b90bc06@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu,  8 Jul 2021 17:03:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Python 2 is no longer supported, depend on python3 and propagate
> reverse dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/docker-compose/Config.in         | 7 ++-----
>  package/python-bcrypt/Config.in          | 2 +-
>  package/python-bcrypt/python-bcrypt.hash | 6 +++---
>  package/python-bcrypt/python-bcrypt.mk   | 4 ++--
>  package/python-paramiko/Config.in        | 5 +++--
>  package/python-pysftp/Config.in          | 1 +
>  6 files changed, 12 insertions(+), 13 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
