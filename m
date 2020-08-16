From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 11:28:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: link with libatomic if
 needed
In-Reply-To: <20200815215730.3901102-1-fontaine.fabrice@gmail.com>
References: <20200815215730.3901102-1-fontaine.fabrice@gmail.com>
Message-ID: <20200816112837.41f8cfd4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Aug 2020 23:57:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/12f4580429427b6b546184366f74da16f83d692c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mpv/mpv.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
