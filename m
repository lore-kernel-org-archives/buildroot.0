From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:18:27 +0100
Subject: [Buildroot] [PATCH 2/2] python-webpy: add a hash file and use
 pypi download location
In-Reply-To: <1450081557-29241-2-git-send-email-yegorslists@googlemail.com>
References: <1450081557-29241-1-git-send-email-yegorslists@googlemail.com>
 <1450081557-29241-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151219141827.1958b51b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Mon, 14 Dec 2015 09:25:57 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-webpy/python-webpy.hash | 3 +++
>  package/python-webpy/python-webpy.mk   | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>  create mode 100644 package/python-webpy/python-webpy.hash

We had to essentially revert this commit, because it was breaking
legal-info. See
https://git.busybox.net/buildroot/commit/?id=85854ac8b3daefea43cad5c289780f3eeef447b2.

Don't hesitate to talk with upstream to have them include the license
files in the pypi tarballs.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
