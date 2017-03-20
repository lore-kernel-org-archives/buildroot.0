From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:59:48 +0100
Subject: [Buildroot] [PATCH] package/libkcapi: bump version to latest
 git hash 79cb80714ebc
In-Reply-To: <1490005509-9565-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1490005509-9565-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <20170320215948.2494e40d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 11:25:09 +0100, Marcin Nowakowski wrote:
> Configure script is used to detect options supported by the target
> compiler, but those options are then incorrectly used by the targets
> compiled using a host compiler.
> 
> configure:
>   checking whether CC supports -fstack-protector-strong... yes
> make:
>   /usr/bin/gcc (...)
>   cc1: error: unrecognized command line option "-fstack-protector-strong"
> 
> Fixes:
>   http://autobuild.buildroot.net/results/4c0/4c06dfa35ef52f6522619f797a9ae4e7a2e45d04/
>   http://autobuild.buildroot.net/results/788/78886670cff406a09bd08808d9a6e328ee75634b/
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> ---
>  package/libkcapi/libkcapi.hash | 2 +-
>  package/libkcapi/libkcapi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
