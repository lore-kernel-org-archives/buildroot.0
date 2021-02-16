From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 22:08:07 +0100
Subject: [Buildroot] [PATCH] package/janet: new package
In-Reply-To: <20210213113928.3441398-1-francois.perrad@gadz.org>
References: <20210213113928.3441398-1-francois.perrad@gadz.org>
Message-ID: <20210216220807.071eaea0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Feb 2021 12:39:28 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/janet/Config.in  | 10 ++++++++++
>  package/janet/janet.hash |  5 +++++
>  package/janet/janet.mk   | 22 ++++++++++++++++++++++
>  5 files changed, 39 insertions(+)
>  create mode 100644 package/janet/Config.in
>  create mode 100644 package/janet/janet.hash
>  create mode 100644 package/janet/janet.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
