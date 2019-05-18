From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 21:58:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh2: fix build with openssl
 and atomic
In-Reply-To: <20190518095323.24021-1-fontaine.fabrice@gmail.com>
References: <20190518095323.24021-1-fontaine.fabrice@gmail.com>
Message-ID: <20190518215847.494cffe8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 May 2019 11:53:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/e381eefa39307f1c8eb22f872df438b3fe0352dd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libssh2/libssh2.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
