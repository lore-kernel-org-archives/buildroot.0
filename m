From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:14:32 +0100
Subject: [Buildroot] [PATCH 1/2] libpjsip: needs threads
In-Reply-To: <1457387805-4084-1-git-send-email-luca@lucaceresoli.net>
References: <1457387805-4084-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160308211432.4287eee7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon,  7 Mar 2016 22:56:44 +0100, Luca Ceresoli wrote:
> Builds without thread support fail with the following error:
> 
>   ../src/pj/os_core_unix.c:45:21: fatal error: pthread.h: No such file or directory
>    #include <pthread.h>
>                        ^
>   compilation terminated.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/744/744431e1b47d22222c4d0b48d5d20649dfeed929/
>   http://autobuild.buildroot.org/results/a10/a10aca9139054502e055cb61f3925637fc515e12/
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/libpjsip/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
