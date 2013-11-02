From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 19:37:03 +0100
Subject: [Buildroot] [PATCH 1/2] libnl: simplify makefile by using
 --{enable, disable}-cli
In-Reply-To: <1383387986-9508-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383387986-9508-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131102193703.163ed17a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Sat,  2 Nov 2013 11:26:25 +0100, Thomas Petazzoni wrote:
> The libnl configure script has a --{enable,disable}-cli options that
> allows to enable or disable the compilation of the libnl tools. Use
> this option instead of compiling everything and then removing the
> installed programs.
> 
> Note that we also get rid of the uninstall command, which is planned
> to be globally removed in Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libnl/libnl.mk | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)

Committed both patches to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
