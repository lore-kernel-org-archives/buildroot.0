From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:32:17 +0200
Subject: [Buildroot] [PATCH 3/4] package/wpewebkit: bump to version
 2.26.0
In-Reply-To: <20190920213826.2531495-4-aperez@igalia.com>
References: <20190920213826.2531495-1-aperez@igalia.com>
 <20190920213826.2531495-4-aperez@igalia.com>
Message-ID: <20190928233217.6b29bb78@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Sep 2019 00:38:25 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a new major release which brings in many improvements and new
> features. For a complete list, please refer to the release notes:
> 
>   https://wpewebkit.org/release/wpewebkit-2.26.0.html
> 
> The new support for accessibility and the Bubblewrap sandbox need
> additional dependencies and therefore are explicitly disabled at the
> moment.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/wpewebkit.hash | 8 ++++----
>  package/wpewebkit/wpewebkit.mk   | 4 +++-
>  2 files changed, 7 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
