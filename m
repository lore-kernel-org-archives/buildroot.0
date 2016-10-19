From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:36:39 +0200
Subject: [Buildroot] [PATCH v3 1/2] inadyn: bump to version 2.0
In-Reply-To: <20161017201431.23273-1-bluemrp9@gmail.com>
References: <20161017201431.23273-1-bluemrp9@gmail.com>
Message-ID: <20161019233639.19dafb36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 13:14:30 -0700, Ryan Coe wrote:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
> Changes v2 -> v3:
>   - updated default conf file instead of removing it (suggested by Thomas)
> Changes v1 -> v2:
>   - added explaination for removal of default conf (suggested by Thomas)
>   - moved changes to DEVELOPERS file into separate patch (suggested by Thomas)
>   - reordered "select" statements in Config.in (suggested by Thomas)
>   - moved dependencies in inadyn.mk (suggested by Thomas)
> ---
>  package/inadyn/Config.in   |  2 ++
>  package/inadyn/inadyn.conf | 14 +++++++-------
>  package/inadyn/inadyn.hash |  4 ++--
>  package/inadyn/inadyn.mk   | 13 ++++++++++---
>  4 files changed, 21 insertions(+), 12 deletions(-)

Both patches applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
