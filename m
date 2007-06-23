From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 23 Jun 2007 11:51:23 +0200
Subject: [Buildroot] [PATCH] libsndfile
In-Reply-To: <f0528b5b0706221505t6aa35866sa135a3fa21132fd6@mail.gmail.com>
References: <f0528b5b0706221505t6aa35866sa135a3fa21132fd6@mail.gmail.com>
Message-ID: <20070623095123.GH4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 23, 2007 at 12:05:16AM +0200, Julien Letessier wrote:
>Fixed a type in the binary target.
>Had the library installed in the $(STAGING_DIR) for clients to link with.

Thanks! You had forgotten to rm the stuff installed into the
staging_dir for -clean..
Applied as r18898 with some cosmetic changes
