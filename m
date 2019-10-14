From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:02:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-ibmiotf: bump to version
 0.4.0
In-Reply-To: <20191014191228.13432-3-asafka7@gmail.com>
References: <20191014191228.13432-1-asafka7@gmail.com>
 <20191014191228.13432-3-asafka7@gmail.com>
Message-ID: <20191014220226.015634ef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 22:12:18 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> * Update dependency list.
> * Take tarball from PyPI.
> * Update license hash: same content, changed to UNIX line endings.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-ibmiotf/Config.in           | 2 --
>  package/python-ibmiotf/python-ibmiotf.hash | 8 +++++---
>  package/python-ibmiotf/python-ibmiotf.mk   | 5 +++--
>  3 files changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
