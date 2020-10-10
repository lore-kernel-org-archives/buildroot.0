From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:53:46 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/mtd: add host-acl dependency
 for host
In-Reply-To: <20201008090836.2670553-1-antoine.tenart@bootlin.com> (Antoine
 Tenart's message of "Thu, 8 Oct 2020 11:08:35 +0200")
References: <20201008090836.2670553-1-antoine.tenart@bootlin.com>
Message-ID: <87k0vxerad.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Antoine" == Antoine Tenart <antoine.tenart@bootlin.com> writes:

 > When compiling the host version of mtd, --with-jffs and --with-ubifs are
 > always set, meaning --with-xattr is set by default. The xattr support
 > only work if 'sys/acl.h' is available, otherwise the feature is silently
 > dropped (a warning is shown during the configuration step).

 > This patch adds a dependency on host-acl for host-mtd, so that the xattr
 > feature is correctly supported. Logic to have xattr support is already
 > there and working for the non-host flavour.

 > Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
 > Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
