From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:49:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/rocksdb: fix build on m68k_cf
In-Reply-To: <20200328155829.1133494-1-fontaine.fabrice@gmail.com>
References: <20200328155829.1133494-1-fontaine.fabrice@gmail.com>
Message-ID: <20200329154933.5e6065e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Mar 2020 16:58:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/04c5afff034d8d71d11b95c998e3156292852de6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rocksdb/rocksdb.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
