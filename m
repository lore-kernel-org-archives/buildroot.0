From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 09:07:09 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/bitcoin: bump to version 0.19.0.1
In-Reply-To: <20200122212637.1008692-1-fontaine.fabrice@gmail.com>
References: <20200122212637.1008692-1-fontaine.fabrice@gmail.com>
Message-ID: <20200202090709.2c9afa39@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jan 2020 22:26:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Retrieve official tarball instead of using github as specified in
>   https://github.com/bitcoin/bitcoin/releases/tag/v0.19.0.1
> - Remove patch (already in version)
> - Update hash of COPYING (update in year:
>   https://github.com/bitcoin/bitcoin/commit/ae5594d51b489826f2f2315c92e8df5ee0267efc)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix version in title

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
