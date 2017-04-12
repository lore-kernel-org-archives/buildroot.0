From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 22:14:28 +0200
Subject: [Buildroot] [PATCH] proftpd: bump version to 1.3.6
In-Reply-To: <20170410105506.60414-1-Vincent.Riera@imgtec.com>
References: <20170410105506.60414-1-Vincent.Riera@imgtec.com>
Message-ID: <20170412221428.6719ba7a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Apr 2017 11:55:06 +0100, Vicente Olivert Riera wrote:
> Patch 0002-__mempcpy.patch is not necessary since this commit:
> 
> https://github.com/proftpd/proftpd/commit/8dfaceb389d924920bb4f4dd47ddeb2c78fb5f2a
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Build tested with uClibc to confirm the patch 0002-__mempcpy.patch is
> not necessary. That patch was there because when building for uClibc we
> were seeing a link failure. I haven't seen such a failure with 1.3.6.
> ---
>  package/proftpd/0002-__mempcpy.patch | 54 ------------------------------------
>  package/proftpd/proftpd.hash         |  6 ++--
>  package/proftpd/proftpd.mk           |  2 +-
>  3 files changed, 4 insertions(+), 58 deletions(-)
>  delete mode 100644 package/proftpd/0002-__mempcpy.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
