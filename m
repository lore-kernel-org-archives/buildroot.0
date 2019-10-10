From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:47:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-webencodings: new package
In-Reply-To: <20191009193137.19635-1-asafka7@gmail.com>
References: <20191009193137.19635-1-asafka7@gmail.com>
Message-ID: <20191010224742.5a9f81cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Oct 2019 22:31:36 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> License is not included in the tarball, so we'll use PKG-INFO
> (the license was added to the MANIFEST, and maybe included on the
> next release).
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  package/python-webencodings/Config.in              |  6 ++++++
>  .../python-webencodings/python-webencodings.hash   |  5 +++++
>  package/python-webencodings/python-webencodings.mk | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-webencodings/Config.in
>  create mode 100644 package/python-webencodings/python-webencodings.hash
>  create mode 100644 package/python-webencodings/python-webencodings.mk

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
