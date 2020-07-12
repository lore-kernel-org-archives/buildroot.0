From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 15:43:06 +0200
Subject: [Buildroot] [PATCH v3 7/7] package/libodb-boost: new package
In-Reply-To: <20200706153040.427457-8-kamel.bouhara@bootlin.com>
References: <20200706153040.427457-1-kamel.bouhara@bootlin.com>
 <20200706153040.427457-8-kamel.bouhara@bootlin.com>
Message-ID: <20200712154306.4cce2744@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jul 2020 17:30:40 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> This package contains the Boost ODB profile library. The Boost profile
> provides support for persisting Boost smart pointers, containers, and
> value types with the ODB system.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

Thanks, I have applied after fixing a few details: check-package
warnings about indentation in Config.in file and about consecutive
empty lines in hash file, but also alphabetic ordering in DEVELOPERS
file as well as spacing in the hash file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
