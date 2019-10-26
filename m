From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 18:55:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: remove 'v' prefix
 from github-fetched packages
In-Reply-To: <20190831103456.5261-1-bernd.kuhls@t-online.de>
References: <20190831103456.5261-1-bernd.kuhls@t-online.de>
Message-ID: <20191026185557.3c46f5a2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Aug 2019 12:34:56 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes version parsing for release-monitoring.org support.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/flatbuffers/flatbuffers.hash | 2 +-
>  package/flatbuffers/flatbuffers.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
