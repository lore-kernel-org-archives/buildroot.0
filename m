From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 22:29:42 +0200
Subject: [Buildroot] [PATCH 1/1] Fix config.mak.uname to allow
 cross-compilation
In-Reply-To: <1463948643-21344-2-git-send-email-mc5686@mclink.it>
References: <1463948643-21344-1-git-send-email-mc5686@mclink.it>
 <1463948643-21344-2-git-send-email-mc5686@mclink.it>
Message-ID: <20160522222942.37041c37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution.

On Sun, 22 May 2016 22:24:03 +0200, Mauro Condarelli wrote:
> Current implementation imperatively sets variables from "uname" output.
> This breaks cross-compilation because uname is run on host while target
> configuration may be different.
> 
> Make current behavior a non-imperative default, so it's possible to
> force different values setting make variables.
> 
> To cross-compile it will be necessary to explicitly set the various
> uname_X variables to values compatible with target.
> No change is needed with normal host compilation.
> Patch is trivial.
> 
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  config.mak.uname | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

This patch cannot be applied, as it is a patch against Git directly,
while you should send patches against Buildroot. I.e, a patch that adds
a patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
