From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 14:51:40 +0200
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to 6.2.1
In-Reply-To: <1464950477-3122-2-git-send-email-martin@barkynet.com>
References: <1464950477-3122-1-git-send-email-martin@barkynet.com>
 <1464950477-3122-2-git-send-email-martin@barkynet.com>
Message-ID: <20160603145140.7a739624@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Jun 2016 11:41:17 +0100, Martin Bark wrote:
> See https://nodejs.org/en/blog/release/v6.2.1/
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  .../{6.1.0 => 6.2.1}/0001-gyp-force-link-command-to-use-CXX.patch     | 0
>  package/nodejs/Config.in                                              | 2 +-
>  package/nodejs/nodejs.hash                                            | 4 ++--
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/nodejs/{6.1.0 => 6.2.1}/0001-gyp-force-link-command-to-use-CXX.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
