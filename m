From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:11:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-docker: bump to version
 4.1.0
In-Reply-To: <20191021134031.20586-3-asafka7@gmail.com>
References: <20191021134031.20586-1-asafka7@gmail.com>
 <20191021134031.20586-3-asafka7@gmail.com>
Message-ID: <20191021191142.742f4806@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 16:40:23 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> python-docker-pycreds is no longer needed as a dependency.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-docker/Config.in          | 1 -
>  package/python-docker/python-docker.hash | 7 ++++---
>  package/python-docker/python-docker.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
