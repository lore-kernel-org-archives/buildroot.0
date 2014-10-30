From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:51:22 +0100
Subject: [Buildroot] [PATCH v3] mongrel2: Add comments to avoid use of
 github call
In-Reply-To: <1413142758-3356-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413142758-3356-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141030225122.688a3552@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 12 Oct 2014 21:39:18 +0200, Maxime Hadjinlian wrote:
> As the comment says, we don't want to uses the github helper, as we
> would end up with a generated tarball, which is not the same one as the
> one linked with the releases.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v2 -> v3:
>    - fix typo
> v1 -> v2:
>    - Do not change the URL but add a comments instead
> ---
>  package/mongrel2/mongrel2.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
