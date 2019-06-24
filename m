From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Jun 2019 06:36:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: security bump to
 version 2.60.4
In-Reply-To: <20190623174733.73859-1-aduskett@gmail.com>
References: <20190623174733.73859-1-aduskett@gmail.com>
Message-ID: <20190624063638.69f04f8c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jun 2019 13:47:33 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Fixes critical CVE-2019-12450:
>   https://nvd.nist.gov/vuln/detail/CVE-2019-12450
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libglib2/0003-remove-cpp-requirement.patch            | 2 +-
>  ...0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch | 2 +-
>  package/libglib2/libglib2.hash                                | 4 ++--
>  package/libglib2/libglib2.mk                                  | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
