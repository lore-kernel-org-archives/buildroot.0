From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 21:58:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: annotate
 CVE-2021-27803
In-Reply-To: <20210322191316.1171234-1-fontaine.fabrice@gmail.com>
References: <20210322191316.1171234-1-fontaine.fabrice@gmail.com>
Message-ID: <20210330215849.3ce91562@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Mar 2021 20:13:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a WPA_SUPPLICANT_IGNORE_CVES entry for CVE-2021-27803 which was
> fixed by commit 9ada4eb2f1c3d67ee49f6f5466738bcd821fc647
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
