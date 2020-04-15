From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:51:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: needs dynamic
 library
In-Reply-To: <20200414120715.1449106-1-fontaine.fabrice@gmail.com>
References: <20200414120715.1449106-1-fontaine.fabrice@gmail.com>
Message-ID: <20200415215145.4977e304@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 14:07:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pkcs11-helper unconditionally use dlfcn.h in lib/pkcs11h-core.c
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3411074765312e67dab0f71876a254721911714f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pkcs11-helper/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
