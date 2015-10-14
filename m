From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:14:48 +0200
Subject: [Buildroot] [PATCH v4] systemd: Bump version and change hosting
In-Reply-To: <1443864014-29055-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443864014-29055-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151014231448.6228aa77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat,  3 Oct 2015 11:20:14 +0200, Maxime Hadjinlian wrote:
> systemd seems to do its release using their github repository up from
> the 221 version.
> 
> Since they use the auto generated release, we can't have a hash file.
> 
> They don't provide the Makefile.in file in the 'po' directory.
> We need to run intltoolize so it's created for us.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v3 -> v4:
>     - Don't use autogen.sh (run some tests that applies on the host
>       machine), instead call intltoolize alone.
> ---
>  package/systemd/systemd.hash |  2 --
>  package/systemd/systemd.mk   | 10 +++++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>  delete mode 100644 package/systemd/systemd.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
