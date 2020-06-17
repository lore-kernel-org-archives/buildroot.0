From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:58:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to
 version 3.1.7
In-Reply-To: <20200615184632.493821-3-asafka7@gmail.com>
References: <20200615184632.493821-1-asafka7@gmail.com>
 <20200615184632.493821-3-asafka7@gmail.com>
Message-ID: <20200617225823.775ab096@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jun 2020 21:46:27 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> * License was changed from UNIX to Windows line endings.
> * SETUP_TYPE is actually distutils, and not setuptools.
> * Use two spaces for hash file indentation.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-bitstring/python-bitstring.hash | 6 +++---
>  package/python-bitstring/python-bitstring.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
