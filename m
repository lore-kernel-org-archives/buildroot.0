From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 22:26:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: depends on gcc >= 4.9
In-Reply-To: <20200913165336.2685439-1-fontaine.fabrice@gmail.com>
References: <20200913165336.2685439-1-fontaine.fabrice@gmail.com>
Message-ID: <20200913222633.1b4695ee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Sep 2020 18:53:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> efl depends on C++11 since version 1.22.0 and
> https://github.com/Enlightenment/efl/commit/ac95f38d1b06ac6977ea6d8b9f14f9405396858f
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/458ec719a7251b59796edfc865b7226baaed6d8f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/efl/Config.in | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
