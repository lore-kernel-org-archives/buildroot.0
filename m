From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 19:06:35 +0200
Subject: [Buildroot] [for-next: PATCH 2/2] toolchain: update paranoid
 unsafe path comment
In-Reply-To: <1463307961-29759-2-git-send-email-romain.naour@gmail.com>
References: <1463307961-29759-1-git-send-email-romain.naour@gmail.com>
 <1463307961-29759-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160515190635.7d5b6a13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 May 2016 12:26:01 +0200, Romain Naour wrote:
> Since 919c06c28295f19ca49459b98d8954148b381360 the calls to gcc always pass
> through the toolchain wrapper and all gcc patches to support poisoning has been
> removed.
> 
> Update the BR2_COMPILER_PARANOID_UNSAFE_PATH comment.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I know you labeled this patch as being "for next", but I believe it
really should be applied to master, so that's what I've done.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
