From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Sep 2017 09:30:12 +0200
Subject: [Buildroot] [PATCH] python-cryptography: add missing dependency
 on BR2_PACKAGE_PYTHON_HASHLIB
In-Reply-To: <1504780681-27563-1-git-send-email-yegorslists@googlemail.com>
References: <1504780681-27563-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20170910093012.54b672f0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Sep 2017 12:38:01 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> HASHLIB is only needed for Python 2.
> 
> While at this sort dependencies alphabetically.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-cryptography/Config.in | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
