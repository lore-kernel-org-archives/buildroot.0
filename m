From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 15:37:56 +0200
Subject: [Buildroot] [PATCH v3 6/7] package/libodb-mysql: new package
In-Reply-To: <20200706153040.427457-7-kamel.bouhara@bootlin.com>
References: <20200706153040.427457-1-kamel.bouhara@bootlin.com>
 <20200706153040.427457-7-kamel.bouhara@bootlin.com>
Message-ID: <20200712153756.0e2f7f14@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jul 2020 17:30:39 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> This package contains the MySQL ODB runtime library. Every application
> that includes code generated for the MySQL database will need to link
> to this library.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

There were a few "make check-package" warnings here as well: patches
having a sequence number in their title, lines too long in Config.in
file, bogus indentation in Config.in file.

I fixed those minor nits, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
