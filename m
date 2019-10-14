From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:03:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pathlib2: bump to
 version 2.3.5
In-Reply-To: <20191014191228.13432-5-asafka7@gmail.com>
References: <20191014191228.13432-1-asafka7@gmail.com>
 <20191014191228.13432-5-asafka7@gmail.com>
Message-ID: <20191014220330.58d4160e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 22:12:20 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> And remove scandir from runtime dependencies.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pathlib2/Config.in            | 1 -
>  package/python-pathlib2/python-pathlib2.hash | 4 ++--
>  package/python-pathlib2/python-pathlib2.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
