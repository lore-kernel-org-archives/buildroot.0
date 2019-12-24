From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 13:55:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: alsa support needs
 rawmidi and seq
In-Reply-To: <20191224100637.915534-1-fontaine.fabrice@gmail.com>
References: <20191224100637.915534-1-fontaine.fabrice@gmail.com>
Message-ID: <20191224135521.451291db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Dec 2019 11:06:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/8c8149a7cf87f24271fa6af8a6c81d2dfe241bbe
>  - http://autobuild.buildroot.org/results/d7b05205b0bb45d927b5bb462e06fd8c345ebc42
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fluidsynth/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
