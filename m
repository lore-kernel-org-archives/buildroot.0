From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 23:34:08 +0200
Subject: [Buildroot] [RESEND][PATCH v2 1/3] toolchain: configs: improve
 toolchain config readability
In-Reply-To: <1470681301-6374-1-git-send-email-pgynther@google.com>
References: <1470681301-6374-1-git-send-email-pgynther@google.com>
Message-ID: <20161025233408.548c288b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Aug 2016 11:34:59 -0700, Petri Gynther wrote:
> Add (or move) comment lines in toolchain-related Config.in files
> to improve readability of the toolchain config section.
> 
> Source linux-headers/Config.in.host after toolchain-buildroot items.
> 
> For toolchain-buildroot case, the config file now looks like this:
> *
> * Toolchain
> *
> 
> *
> * Toolchain Buildroot Options
> *
> 
> *
> * Kernel Header Options
> *
> 
> *
> * uClibc Options
> *
> 
> *
> * Binutils Options
> *
> 
> *
> * GCC Options
> *
> 
> *
> * Host GDB Options
> *
> 
> *
> * Toolchain Generic Options
> *
> 
> Signed-off-by: Petri Gynther <pgynther@google.com>
> ---
>  package/gdb/Config.in.host              | 2 ++
>  package/linux-headers/Config.in.host    | 4 ++--
>  package/uclibc/Config.in                | 4 ++--
>  toolchain/toolchain-buildroot/Config.in | 5 +++--
>  toolchain/toolchain-common.in           | 2 ++
>  toolchain/toolchain-external/Config.in  | 2 ++
>  6 files changed, 13 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
