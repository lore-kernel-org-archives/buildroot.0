From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:39:51 +0200
Subject: [Buildroot] [PATCH] package/python-tornado: bump version to
 6.0.4
In-Reply-To: <20200425000542.3204-1-ryanbarnett3@gmail.com>
References: <20200425000542.3204-1-ryanbarnett3@gmail.com>
Message-ID: <20200425153951.35ba3048@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 19:05:42 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> Convert the hash file to using the two space format for hashes. The
> has for the LICENSE file has been updated since version 6.0.4 now
> includes DOS line endings (\r\n).

Switching to using DOS line endings in 2020. Come on...

> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  package/python-tornado/python-tornado.hash | 6 +++---
>  package/python-tornado/python-tornado.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Nevertheless, applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
