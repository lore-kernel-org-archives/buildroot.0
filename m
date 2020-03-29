From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:13:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.28.0
In-Reply-To: <20200324215809.77787-1-james.hilliard1@gmail.com>
References: <20200324215809.77787-1-james.hilliard1@gmail.com>
Message-ID: <20200329221302.4d9a1022@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Mar 2020 15:58:09 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Adjust fix build with musl patch for 2.28.0.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/wpewebkit/0001-Fix-build-with-musl.patch | 6 +++---
>  package/wpewebkit/wpewebkit.hash                 | 8 ++++----
>  package/wpewebkit/wpewebkit.mk                   | 2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)

Applied to master, thanks. Why isn't the musl patch upstream ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
