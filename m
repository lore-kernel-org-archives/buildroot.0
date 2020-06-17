From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:58:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version
 4.5.1
In-Reply-To: <20200615184632.493821-4-asafka7@gmail.com>
References: <20200615184632.493821-1-asafka7@gmail.com>
 <20200615184632.493821-4-asafka7@gmail.com>
Message-ID: <20200617225825.70c19577@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jun 2020 21:46:28 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> The options --with-xslt-config and --with-xml2-config were
> renamed to --xslt-config and --xml2-config", respectively.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-lxml/python-lxml.hash |  2 +-
>  package/python-lxml/python-lxml.mk   | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
