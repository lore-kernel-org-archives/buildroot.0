From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 21:56:36 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/domoticz: fix build with RELRO
In-Reply-To: <20191108170445.29361-1-fontaine.fabrice@gmail.com>
References: <20191108170445.29361-1-fontaine.fabrice@gmail.com>
Message-ID: <20191108215636.3292b399@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Nov 2019 18:04:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/5c1ca3083ad672401d1e050c6c3a07b8c33b851d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Retrieve upstream patch that adds -c as suggested by Arnout during
>    review of v1

Thanks for the additional work, this seems like a much better solution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
