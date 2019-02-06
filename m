From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 09:47:27 +0100
Subject: [Buildroot] [PATCH v3 3/4] package/ffmpeg: bump to version 4.1
In-Reply-To: <20190205181946.14496-4-lpdev@cordier.org>
References: <20190205181946.14496-1-lpdev@cordier.org>
 <20190205181946.14496-4-lpdev@cordier.org>
Message-ID: <20190206094727.24dfa441@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Feb 2019 19:19:45 +0100
Louis-Paul Cordier <lpdev@cordier.org> wrote:

> FFserver is not supported anymore
> Remove patch 0001: fixed upstream in cae6f806a6367c7760ab6ed059d343d4a8eebd56
> Remove patch 0002 to 0004: accepted upstream
> 
> Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>

As was previously discussed, we cannot merge this if all packages that
depend on ffmpeg are not compatible with ffmpeg 4.x.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
