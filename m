From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:20:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11vnc: requires blowfish,
 RC4 and RMD160 support in openssl
In-Reply-To: <20210710093232.1164634-1-fontaine.fabrice@gmail.com>
References: <20210710093232.1164634-1-fontaine.fabrice@gmail.com>
Message-ID: <20210716232000.3eccf2af@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 10 Jul 2021 11:32:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Enable blowfish, RC4 and RMD160 in openssl to fix build failure raised since
> commit a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1872c9ce57490455946679efcc654bd111fd3d7b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/x11vnc/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
