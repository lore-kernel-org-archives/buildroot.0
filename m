From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:37:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/yaml-cpp: build shared library
 if needed
In-Reply-To: <20200421183543.4135516-1-fontaine.fabrice@gmail.com>
References: <20200421183543.4135516-1-fontaine.fabrice@gmail.com>
Message-ID: <20200421213702.283beeab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 20:35:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> yaml-cpp builds only a static library by default, this will raise a
> build failure with upcoming mongodb 4.2.x as reported by Ryan Barnett
> due to mongodb linking with a static library that obviously will miss
> -fPIC
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/yaml-cpp/yaml-cpp.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
