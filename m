From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 21:47:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot: add linux-pam optional
 dependency
In-Reply-To: <20190711165838.9033-1-fontaine.fabrice@gmail.com>
References: <20190711165838.9033-1-fontaine.fabrice@gmail.com>
Message-ID: <20190720214748.5d6ca353@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Jul 2019 18:58:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/bba0d54cab164d77caf7161596b22602875a7a85
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dovecot/dovecot.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
