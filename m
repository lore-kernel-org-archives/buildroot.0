From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:53:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: needs wchar
In-Reply-To: <20200419225024.341725-1-fontaine.fabrice@gmail.com>
References: <20200419225024.341725-1-fontaine.fabrice@gmail.com>
Message-ID: <20200420075319.20dc24d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 00:50:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> exfatprogs unconditionally uses wchar_t in libexfat.h
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/884bbaec2bbbff33c30a0bebda3d95198aa1281c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/exfatprogs/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
