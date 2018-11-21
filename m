From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 20:57:40 +0100
Subject: [Buildroot] [PATCH 1/1] gauche: fix parallel build
In-Reply-To: <20181121174944.24084-1-fontaine.fabrice@gmail.com>
References: <20181121174944.24084-1-fontaine.fabrice@gmail.com>
Message-ID: <20181121205740.459b0d20@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Nov 2018 18:49:44 +0100, Fabrice Fontaine wrote:
> Add a patch to fix parallel build issue on ext/rfc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f4935e29ce6aaebdaa47d46c56120b7e97145d1b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gauche/0004-rfc-needs-srfi.patch | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/gauche/0004-rfc-needs-srfi.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
