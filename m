From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 09:44:21 +0100
Subject: [Buildroot] [PATCH v2 1/3] docs/website/js/buildroot.js: switch
 var to let
In-Reply-To: <20190204142731.8429-1-aduskett@gmail.com>
References: <20190204142731.8429-1-aduskett@gmail.com>
Message-ID: <20190205094421.559bf72a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Feb 2019 15:27:29 +0100
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> In javascript, let is preferred for local, var is preferred for global.
> Change any local variables from "var" to "let"
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Updated to apply to latest master commit.

Series applied to master, thanks! Thanks also to Angelo for the
review/testing.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
