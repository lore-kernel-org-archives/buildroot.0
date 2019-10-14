From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:23:53 +0200
Subject: [Buildroot] [PATCH 3/3] package/python-cheroot: bump to version
 8.1.0
In-Reply-To: <20191014191228.13432-13-asafka7@gmail.com>
References: <20191014191228.13432-1-asafka7@gmail.com>
 <20191014191228.13432-13-asafka7@gmail.com>
Message-ID: <20191014222353.2d87306d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 22:12:28 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> * Add host-python-setuptools-scm-git-archive as build-time dependecy.
> * Update runtime dependecies list.
> * Update license file name (and hash): LICENSE was renamed to LICENSE.md
>   with no changes. After that, the copyright year was bumped.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-cheroot/Config.in           | 4 ++++
>  package/python-cheroot/python-cheroot.hash | 9 +++++----
>  package/python-cheroot/python-cheroot.mk   | 8 ++++----
>  3 files changed, 13 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
