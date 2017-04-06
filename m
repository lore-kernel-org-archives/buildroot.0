From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:45:40 +0200
Subject: [Buildroot] [PATCH 01/11] package: remove trailing whitespace
In-Reply-To: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
References: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
Message-ID: <20170406224540.33d0f056@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Apr 2017 19:50:09 -0300, Ricardo Martincoski wrote:
> Occurrences were searched using [1]:
> check-package --include-only TrailingSpace $(find * -type f)
> and manually removed.
> 
> [1] http://patchwork.ozlabs.org/patch/729666/
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> build-tested with:
> $ echo BR2_GOOGLE_BREAKPAD_ENABLE=y > host-google-breakpad.config
> $ support/scripts/test-pkg -c host-google-breakpad.config \
>   -d /home/builds/test-pkg -p host-google-breakpad
> 49 builds, 29 skipped, 0 failed
> ---
>  package/google-breakpad/google-breakpad.mk | 2 +-
>  package/leafnode2/leafnode2.mk             | 2 +-
>  package/mbedtls/Config.in                  | 2 +-
>  package/protobuf/Config.in                 | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

I've applied patches 1 to 10, but left patch 11 unapplied for now. I'll
reply to patch 11 to explain why.

Thanks a lot for doing this great cleanup series, much appreciated!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
