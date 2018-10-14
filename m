From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 10:00:38 +0200
Subject: [Buildroot] [PATCH 1/1] python-psycopg2: add patch to avoid
 installing tests
In-Reply-To: <20181012063655.10229-1-asafka7@gmail.com>
References: <20181012063655.10229-1-asafka7@gmail.com>
Message-ID: <20181014100038.3facdfea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Oct 2018 09:36:55 +0300, Asaf Kahlon wrote:
> It's already on upstream, and will be removed on the next bump.
> 
> Fixes:
> http://autobuild.buildroot.org/results/31c/31c942a43064fc012286724e545773cba6e57cc3/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...id-installing-tests-to-site-packages.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/python-psycopg2/0001-setup.py-avoid-installing-tests-to-site-packages.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
