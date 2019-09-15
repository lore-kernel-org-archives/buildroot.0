From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 21:36:28 +0200
Subject: [Buildroot] [PATCH 21/27] package/xterm: bump to version 348
In-Reply-To: <20190908161237.27103-1-chrismcc@gmail.com>
References: <20190908161237.27103-1-chrismcc@gmail.com>
Message-ID: <20190915213628.1dee5a7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Sep 2019 09:12:37 -0700
Christopher McCrory <chrismcc@gmail.com> wrote:

> Add COPYING to _LICENSE_FILES
> 
> Add hashs for _LICENSE_FILES
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

With the new COPYING file added, it no longer makes sense to have
version.c in the license files. So I've applied your patch, after
tweaking it to no longer use version.c as the license files, and only
have COPYING.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
