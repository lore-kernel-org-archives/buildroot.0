From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:31:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-docutils: add upstream
 patch to build without setuptools
In-Reply-To: <20191025185448.32633-1-asafka7@gmail.com>
References: <20191025185448.32633-1-asafka7@gmail.com>
Message-ID: <20191026153129.7c970b5a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 21:54:43 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> An upstream patch to enable building without setuptools is added.
> The original commit is adjusted slightly to fit the current version.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/8f3c01f0e286c6b15c8c973f91dd69ee816a58b9
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  .../0001-Update-setup.py.patch                | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/python-docutils/0001-Update-setup.py.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
