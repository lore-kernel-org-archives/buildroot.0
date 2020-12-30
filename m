From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 23:56:17 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/libnfc: pn53x_usb driver needs gcc >= 4.9
In-Reply-To: <20201216064023.41527-1-fontaine.fabrice@gmail.com>
References: <20201216064023.41527-1-fontaine.fabrice@gmail.com>
Message-ID: <20201230235617.5d40839b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Dec 2020 07:40:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 8a26801c9fad1c7749200e22e9dfdeaeeb65f76e forgot to propagate
> gcc >= 4.9 dependency
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6586f4aecf9a47612bfedfc503c9c2948a17e9d6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Add autobuilder failure

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
