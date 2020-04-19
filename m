From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 22:04:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: fix static build
 with readline
In-Reply-To: <20200110182634.3887115-1-fontaine.fabrice@gmail.com>
References: <20200110182634.3887115-1-fontaine.fabrice@gmail.com>
Message-ID: <20200419220444.228b943b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jan 2020 19:26:34 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/88609eefe55af2ca50d43e17d3424b923528b07a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ....txt-use-pkg-config-to-find-readline.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/fluidsynth/0001-CMakeLists.txt-use-pkg-config-to-find-readline.patch

Thanks for your patch. It turns out that your patch was merged in
upstream fluidsynth, and in the mean time, we have updated to a newer
version of fluidsynth which includes your fix! So I'll mark this
particular patch as Not Applicable, but many thanks for having fixed it
upstream!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
