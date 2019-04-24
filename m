From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:37:44 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: bump version to 1.16.5
In-Reply-To: <20190423194840.11166-1-ps.report@gmx.net>
References: <20190423194840.11166-1-ps.report@gmx.net>
Message-ID: <20190424223744.6a07a465@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Apr 2019 21:48:40 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Update license hash for libv4l1-kernelcode-license.txt (Mauro Carvalho
> e-mail address update).
> 
> Changelog (since 1.16.3):
>   - Update my e-mail on all places
>   - dvb-sat: rename Astra 1E to Astra 19.2 E and move it to beginning
>   - Qt5: test for Desktop OpenGL presence
>   - Qt5: fixup Qt OpenGL automake conditionals
>   - dvbv5-zap.c: fix compile warning
>   - dvbv5-tools: be sure to zero struct arguments
>   - dvbv5-zap: improve program exit code
>   - libdvbv5: leaks and double free in dvb_fe_open_fname()
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libv4l/libv4l.hash | 6 +++---
>  package/libv4l/libv4l.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
