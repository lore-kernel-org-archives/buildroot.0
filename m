From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Aug 2020 00:20:52 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/python-bsdiff4: new package
In-Reply-To: <20200719181128.78893-1-asafka7@gmail.com>
References: <20200719181128.78893-1-asafka7@gmail.com>
Message-ID: <20200809002052.6594fc1b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Jul 2020 21:11:28 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Binary diff and patch using the BSDIFF4-format.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
> v2->v3: use a higher version, license is now shipped with the version
> ---
>  package/Config.in                          |  1 +
>  package/python-bsdiff4/Config.in           |  8 ++++++++
>  package/python-bsdiff4/python-bsdiff4.hash |  5 +++++
>  package/python-bsdiff4/python-bsdiff4.mk   | 14 ++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-bsdiff4/Config.in
>  create mode 100644 package/python-bsdiff4/python-bsdiff4.hash
>  create mode 100644 package/python-bsdiff4/python-bsdiff4.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
