From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:53:56 +0200
Subject: [Buildroot] [PATCH] Add xxhash package
In-Reply-To: <1437080375-96542-1-git-send-email-eswierk@skyportsystems.com>
References: <1437080375-96542-1-git-send-email-eswierk@skyportsystems.com>
Message-ID: <20150919155356.312251c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ed Swierk,

On Thu, 16 Jul 2015 13:59:35 -0700, Ed Swierk wrote:
> "xxHash is an extremely fast hash algorithm, running at RAM
> speed limits."
> 
> Signed-off-by: Ed Swierk <eswierk@skyportsystems.com>
> ---
>  package/Config.in        |  1 +
>  package/xxhash/Config.in |  7 +++++++
>  package/xxhash/xxhash.mk | 19 +++++++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/xxhash/Config.in
>  create mode 100644 package/xxhash/xxhash.mk

Applied, after doing the following changes:

    [Thomas:
     - tweak commit log title
     - add correct license and license files information, using the
       suggestion from Yann E. Morin
     - add $(TARGET_MAKE_ENV) in the environment in the build step.]

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
