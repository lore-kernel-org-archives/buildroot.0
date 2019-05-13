From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 20:54:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/mono: needs C++
In-Reply-To: <20190512104542.12573-1-fontaine.fabrice@gmail.com>
References: <20190512104542.12573-1-fontaine.fabrice@gmail.com>
Message-ID: <20190513205410.0c8d3a1a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 May 2019 12:45:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mono needs a working C++ compiler to get the exact type of size_t since
> version 5.16.0.179 and
> https://github.com/mono/mono/commit/d8af77551de1f59803a46946786e0f9a5eb5cb9d
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ee6d037154127cc6572f06e9a78bae383ea381bc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mono/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
