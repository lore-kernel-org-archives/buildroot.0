From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:31:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/rhash: fix build failure due to
 gcc -v
In-Reply-To: <20201203202853.616174-1-fontaine.fabrice@gmail.com>
References: <20201203202853.616174-1-fontaine.fabrice@gmail.com>
Message-ID: <20201205213101.72a80abc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Dec 2020 21:28:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Why isn't gcc -v working ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
