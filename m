From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 25 Jul 2008 14:07:25 +0200
Subject: [Buildroot] Patch for gcc-uclibc-4.x.mk
In-Reply-To: <49ED01FC03EE524BB7BB258E8F93BFF3265383@bfl-exchange-1.BFL.local>
References: <49ED01FC03EE524BB7BB258E8F93BFF3265383@bfl-exchange-1.BFL.local>
Message-ID: <20080725120725.GB12249@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 25, 2008 at 01:46:42PM +0200, Matuschka, Sebastian wrote:
>Hi,
>
>when compiling with sstrip, the path $(TARGET_DIR)/usr/bin must exist,
>otherwise the compilation of gcc will abort and say that
>$(TARGET_DIR)/usr/bin doesn't exist.

Please show the actual error you were seeing.
