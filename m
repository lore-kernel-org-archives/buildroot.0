From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:14:03 +0200
Subject: [Buildroot] [PATCH 1/9] fix help text wrapping for configs e
In-Reply-To: <20170731135350.9018-1-aduskett@gmail.com>
References: <20170731135350.9018-1-aduskett@gmail.com>
Message-ID: <20170731191403.64ed5fae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 09:53:41 -0400, Adam Duskett wrote:
> The check-package script when ran gives warnings on text wrapping
> on all of these Config files.  This patch cleans up all warnings
> related to the text wrapping for the Config files starting with
> the letter e in the package directory.
> 
> The appropriate indentation is: <tab><2 spaces><62 chars>
> See http://nightly.buildroot.org/#writing-rules-config-in for more
> information.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/ecryptfs-utils/Config.in | 14 +++++++-------
>  package/efibootmgr/Config.in     |  6 +++---
>  package/eigen/Config.in          |  4 ++--
>  package/empty/Config.in          |  3 ++-
>  package/enscript/Config.in       | 12 +++++++-----
>  package/eudev/Config.in          |  8 ++++----
>  package/expedite/Config.in       |  8 ++++----
>  package/ezxml/Config.in          |  3 ++-
>  8 files changed, 31 insertions(+), 27 deletions(-)

I've applied the series but:

 * There was a leftover PATCH 4/4 in the middle of the series. Please
   try to be careful when sending series.

 * The subjects were not really formatted properly. They did not comply
   with the principle of "<package>: <description>". I fixed this up.

 * It's generally quite annoying to get such patches now, when we're
   about to close for -rc1. Do you really want to spend the
   reviewer/maintainer time on reviewing/applying such patches, or
   focus on more important things ? I know we need at some point to fix
   all those warnings, but it's always annoying to receive such massive
   patches :-/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
