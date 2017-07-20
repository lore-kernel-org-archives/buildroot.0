From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 15:49:27 +0200
Subject: [Buildroot] [PATCH v7 0/9] Make the SDK relocatable
In-Reply-To: <1499273594-12106-1-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
Message-ID: <20170720154927.602b868a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 18:53:05 +0200, Wolfgang Grandegger wrote:

> Samuel Martin (1):
>   support/scripts: add fix-rpath script to sanitize the rpath
> 
> Wolfgang Grandegger (8):
>   package/patchelf: add patch for rpath sanitization under a root
>     directory
>   core: sanitize RPATH in staging tree at the end of target finalization
>   core: sanitize RPATH in target tree at the end of target finalization
>   core: sanitize RPATH in host tree at the very end of the build
>   core: install relocation script and location at the end of the build
>   external-toolchain: check if a buildroot SDK has already been
>     relocated
>   support/scripts: relocate-sdk.sh now creates sdk-location in
>     share/buildroot
>   package/qt5base: provide "qt.conf" to make "qmake" relocatable

Could you please Cc: me explicitly for future versions of this patch
series? I'm really interested in following the discussion going on with
Arnout, and I missed the discussion between Arnout and you from earlier
today, because I wasn't Cc'ed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
