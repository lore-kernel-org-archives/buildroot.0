From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 22:34:15 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/collectd: add init script
 for SysV
In-Reply-To: <20191031202859.1058-1-asafka7@gmail.com>
References: <20191031202859.1058-1-asafka7@gmail.com>
Message-ID: <20200413223415.2bcff269@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 31 Oct 2019 22:28:59 +0200
Asaf Kahlon <asafka7@gmail.com> wrote:

> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
> v2->v3: fix Carlos comments.
> ---
>  package/collectd/S90collectd | 51 ++++++++++++++++++++++++++++++++++++
>  package/collectd/collectd.mk |  5 ++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 package/collectd/S90collectd

Applied to master, thanks. Thanks a lot Carlos for the review and
testing!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
