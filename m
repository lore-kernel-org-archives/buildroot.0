From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 21:36:12 +0200
Subject: [Buildroot] [PATCH v2,1/1] domoticz: fix appversion.default
In-Reply-To: <20180814201608.9437-1-fontaine.fabrice@gmail.com>
References: <20180814201608.9437-1-fontaine.fabrice@gmail.com>
Message-ID: <20180815213612.13f85849@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 22:16:08 +0200, Fabrice Fontaine wrote:
> Retrieve correct appversion.default (9700) from upstream
> 
> Without this patch, the wrong version is displayed in the web ui and
> when the user checks for an update, domoticz wrongly says that a new
> version is available
> This issue was reported by an email from Eyal Eshed <eeshed@coldroll.ca>
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Give more details on issue in commit message

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
