From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:37:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-cssselect: bump to
 version 1.1.0
In-Reply-To: <20190930123302.28215-12-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
 <20190930123302.28215-12-asafka7@gmail.com>
Message-ID: <20191002223737.60dc6e65@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 15:32:38 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Also add hash for license file.

Actually...

> diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
> index dd05bebe55..44813416cb 100644
> --- a/package/python-cssselect/python-cssselect.hash
> +++ b/package/python-cssselect/python-cssselect.hash
> @@ -1,4 +1,5 @@
> -# md5 from https://pypi.python.org/pypi/cssselect/json, sha256 locally computed
> -md5	50422c9ec04b74cd60c571f74ddc1a80  cssselect-1.0.3.tar.gz
> -sha256	066d8bc5229af09617e24b3ca4d52f1f9092d9e061931f4184cd572885c23204  cssselect-1.0.3.tar.gz
> -sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE

... the hash was already there :-)

I fixed the commit log when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
