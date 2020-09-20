From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:24:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/cifs-utils: security bump to
 version 6.11
In-Reply-To: <20200920075720.636748-1-fontaine.fabrice@gmail.com>
References: <20200920075720.636748-1-fontaine.fabrice@gmail.com>
Message-ID: <20200920152417.57a94860@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 09:57:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2020-14342: It was found that cifs-utils' mount.cifs was
> invoking a shell when requesting the Samba password, which could be used
> to inject arbitrary commands. An attacker able to invoke mount.cifs with
> special permission, such as via sudo rules, could use this flaw to
> escalate their privileges.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cifs-utils/cifs-utils.hash | 2 +-
>  package/cifs-utils/cifs-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
