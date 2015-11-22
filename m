From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 13:58:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpd: fix static build issue
 with alsa
In-Reply-To: <1448147781-18796-1-git-send-email-joerg.krause@embedded.rocks>
References: <1448147781-18796-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151122135802.5835799b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 22 Nov 2015 00:16:20 +0100, J?rg Krause wrote:
> mpd forgets to link the archive libmixer_plugins.a against libasound leading
> to undefined references in a static context.
> 
> Add a patch sent upstream to fix:
> http://autobuild.buildroot.net/results/f10/f10c6ea2d29bbcef8f33fc9ba1430e99edca895d/
> http://autobuild.buildroot.net/results/312/31212c484f452fe4ea6ae084d3edefc4580830d8/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/mpd/0003-fix-static-build-with-alsa.patch | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/mpd/0003-fix-static-build-with-alsa.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
