From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 11:57:24 +0100
Subject: [Buildroot] [PATCH] support/mkusers: rename variable to avoid
 name clashing
In-Reply-To: <1488578840-11999-1-git-send-email-yann.morin.1998@free.fr>
References: <1488578840-11999-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170304115724.119321f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Mar 2017 23:07:20 +0100, Yann E. MORIN wrote:
> The LINES variable is automatically set by bash to represent the number
> of lines in the terminal. That variable can be set when the shell
> receives SIGWINCH.
> 
> If the shell does receive SIGWINCH after our LINES array is filled, the
> content of the array is mangled.
> 
> Rename the variable to avoid that.
> 
> Fixes #9456
> 
> Reported-by: George Y. <georgebrmz@oss3d.com>
> Reported-by: Paul Stewart <paulstewartis@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/scripts/mkusers | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks. Peter: we want this one for the LTS branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
