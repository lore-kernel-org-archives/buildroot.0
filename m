From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 18:36:58 +0200
Subject: [Buildroot] [PATCH] binutils: drop *.texi* hunks from xtensa
 trampolines patches
In-Reply-To: <1396710856-21928-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396710856-21928-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140405183658.593b60fb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sat,  5 Apr 2014 19:14:16 +0400, Max Filippov wrote:
> Rebuilding as.info with makeinfo version 5.2 results in a build error,
> even with pristine binutils source. Dropping hunks that change *.texi*
> files avoids documentation rebuild.
> 
> Reported-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/binutils/2.22/900-xtensa-trampolines.patch | 131 ---------------------
>  .../binutils/2.23.1/900-xtensa-trampolines.patch   | 131 ---------------------
>  .../binutils/2.23.2/900-xtensa-trampolines.patch   | 131 ---------------------
>  package/binutils/2.24/900-xtensa-trampolines.patch | 131 ---------------------
>  4 files changed, 524 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
