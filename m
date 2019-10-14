From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:26:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-typepy: bump to version
 0.6.0
In-Reply-To: <20191014191228.13432-10-asafka7@gmail.com>
References: <20191014191228.13432-1-asafka7@gmail.com>
 <20191014191228.13432-10-asafka7@gmail.com>
Message-ID: <20191014222641.6e77d6ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Oct 2019 22:12:25 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> * Update dependency list.
> * Add hash for license file.
> * Add patch to avoid creation of wheel file (which breaks the build).
>   The patch is taken from an upstream commit which doesn't apply since
>   Makefile isn't provided in the tarball.

Please use the upstream patch anyway, simply remove the hunk that
modifies the Makefile. It's better to keep upstream's authorship, and
the reference to the upstream commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
