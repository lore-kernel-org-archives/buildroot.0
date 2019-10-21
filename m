From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:13:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 2.2.0
In-Reply-To: <20191021134031.20586-7-asafka7@gmail.com>
References: <20191021134031.20586-1-asafka7@gmail.com>
 <20191021134031.20586-7-asafka7@gmail.com>
Message-ID: <20191021191350.258fa407@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 16:40:27 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> * Update dependency list.
> * Take tarball from PyPI.
> * Add hash for license file.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pymodbus/Config.in            | 1 +
>  package/python-pymodbus/python-pymodbus.hash | 6 ++++--
>  package/python-pymodbus/python-pymodbus.mk   | 5 +++--
>  3 files changed, 8 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
