From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:25:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: add systemd optional
 dependency
In-Reply-To: <20200112190421.3716826-1-fontaine.fabrice@gmail.com>
References: <20200112190421.3716826-1-fontaine.fabrice@gmail.com>
Message-ID: <20200112222530.6626f42b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jan 2020 20:04:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/fa5f8506866451f40eb5f548c1099ae931b26fcc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tor/tor.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
