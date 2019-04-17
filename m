From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 21:05:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/openjdk: only support a
 single variant at a time
In-Reply-To: <20190417143325.5322-1-aduskett@gmail.com>
References: <20190417143325.5322-1-aduskett@gmail.com>
Message-ID: <20190417210541.66665981@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Apr 2019 10:33:25 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> The Zero variant won't build with the server or client also selected at the same
> time, and expressing this in the Config.in would be too complicated to do.
> Even so, selecting multiple variants doesn't seem to be that important in the
> context of Buildroot.
> 
> This patch removes the ability to select multiple variants in favor
> of just selecting one. The default is server as that is what all of the major
> distributions currently use as the default as well.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a45cfa9b3602fd05f6adbf070a1bad6510975c36
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> V1 -> V2:
>  - More explination about the Config.in logic and combining Zero with server
>    and client. (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
