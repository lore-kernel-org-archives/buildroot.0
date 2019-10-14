From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:23:42 +0200
Subject: [Buildroot] [PATCH 1/3]
 package/python-setuptools-scm-git-archive: new package
In-Reply-To: <20191014191228.13432-8-asafka7@gmail.com>
References: <20191014191228.13432-1-asafka7@gmail.com>
 <20191014191228.13432-8-asafka7@gmail.com>
Message-ID: <20191014222342.3178bc80@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 22:12:23 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> The package is only needed for building Python packages, so
> it's going to be compiled for host only.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  .../python-setuptools-scm-git-archive.hash         |  5 +++++
>  .../python-setuptools-scm-git-archive.mk           | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
>  create mode 100644 package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
