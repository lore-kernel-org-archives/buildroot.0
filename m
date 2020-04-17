From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 23:16:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 2.9
In-Reply-To: <20200413225519.122489-1-james.hilliard1@gmail.com>
References: <20200413225519.122489-1-james.hilliard1@gmail.com>
Message-ID: <20200417231637.25ca1998@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Apr 2020 16:55:19 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We can remove CFLAGS="$(TARGET_CFLAGS) -pthread" as of upstream commit:
> https://github.com/pyca/cryptography/commit/085382fb17a560dd11e4710077b63a26d5dcf05c
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cryptography/python-cryptography.hash | 10 +++++-----
>  package/python-cryptography/python-cryptography.mk   |  5 ++---
>  2 files changed, 7 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
