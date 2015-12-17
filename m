From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:16:01 +0100
Subject: [Buildroot] [PATCH] openssl: re-enable parallel build
In-Reply-To: <1449178276-15264-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1449178276-15264-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20151217221601.3186ef90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Thu,  3 Dec 2015 18:31:16 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> The previous incarnation was incomplete, it only applied one of the
> Gentoo patches, hence it had corner cases.
> Apply all 4 patches as pointed out by Mike on the mailing list.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  ...-waste-time-building-manpages-if-we-re-not-going.patch |  5 +++--
>  package/openssl/openssl.hash                              |  5 +++++
>  package/openssl/openssl.mk                                | 15 ++++++++++-----
>  3 files changed, 18 insertions(+), 7 deletions(-)

Let's if this incarnation works properly :-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
