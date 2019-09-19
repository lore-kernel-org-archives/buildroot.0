From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 23:25:28 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/python-colorlog: new package
In-Reply-To: <20190916115504.8575-1-offougajoris@gmail.com>
References: <20190916115504.8575-1-offougajoris@gmail.com>
Message-ID: <20190919232528.600e99cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Sep 2019 13:55:03 +0200
Joris Offouga <offougajoris@gmail.com> wrote:

> Colorlog is a formatter for the python logging module.
> 
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks for your contribution, I've applied to master.

Two minor things that would have made this patch perfect:

 - The two patches for python-colorlog and python-simplelogging should
   have always been sent together. Even if only one of the two has
   changes, always send a new iteration of both patches. Otherwise,
   it's unclear that they are related, and depend on each other.

 - In the DEVELOPERS file, the entries end with a slash, i.e
   package/python-colorlog/ and not package/python-colorlog

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
