From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:39:12 +0200
Subject: [Buildroot] [PATCH] package/python-cbor2: needs
 host-python-setuptools-scm
In-Reply-To: <20200414065915.8310-1-asafka7@gmail.com>
References: <20200414065915.8310-1-asafka7@gmail.com>
Message-ID: <20200415213912.5805be8e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 09:59:15 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Fixes:
>   http://autobuild.buildroot.net/results/124e1e628c78449fbaa027d74ab871b36d782343/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-cbor2/python-cbor2.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
