From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:17:32 +0100
Subject: [Buildroot] [PATCH v2] package/sane-backends: remove unsafe
 headers path
In-Reply-To: <1420905112-31654-1-git-send-email-romain.naour@openwide.fr>
References: <1420905112-31654-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150201231732.29d4ed5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 10 Jan 2015 16:51:52 +0100, Romain Naour wrote:
> Fixes:
> http://autobuild.buildroot.net/results/deb/deb3d45416633b9217d3cc09664273687c809464/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: remove entirely "INCLUDES=" line (Thomas Petazzoni)
> ---
>  .../0003-remove-unsafe-headers-path.patch          | 28 ++++++++++++++++++++++
>  package/sane-backends/sane-backends.mk             |  2 ++
>  2 files changed, 30 insertions(+)
>  create mode 100644 package/sane-backends/0003-remove-unsafe-headers-path.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
