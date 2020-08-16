From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 11:28:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: atomic is mandatory
In-Reply-To: <20200816085027.476250-1-fontaine.fabrice@gmail.com>
References: <20200816085027.476250-1-fontaine.fabrice@gmail.com>
Message-ID: <20200816112847.650ef0e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Aug 2020 10:50:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> __sync builtins have been dropped since version 0.24.0 and
> https://github.com/mpv-player/mpv/commit/c3205d294e519f994829d9355eb133670729aab4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mpv/Config.in   | 4 ++--
>  package/tovid/Config.in | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
