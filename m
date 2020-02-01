From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 17:18:39 +0100
Subject: [Buildroot] [PATCH] package/libnspr: bump version to 4.25
In-Reply-To: <20200201135616.73669-1-giulio.benetti@benettiengineering.com>
References: <20200201135616.73669-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200201171839.71f70c2c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Feb 2020 14:56:16 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Xtensa architecture has been added. Let's use upstream sha1 for
> tarball's hash.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnspr/Config.in    | 1 -
>  package/libnspr/libnspr.hash | 4 ++--
>  package/libnspr/libnspr.mk   | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
