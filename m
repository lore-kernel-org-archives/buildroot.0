From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:39:36 +0100
Subject: [Buildroot] [PATCH] samba4: move x86_64 answer cache file
In-Reply-To: <1393894923-15986-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393894923-15986-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140304193936.5111e4c5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  3 Mar 2014 22:02:03 -0300, Gustavo Zacarias wrote:
> The x86_64 answer cache file from commit
> d191d40e3fd8cef7fbf3168fdc261de8d4b114fd was intended for a previous
> draft version of the samba4 package that resided in a different
> directory.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/{samba => }/samba4/x86_64-cache.txt | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/{samba => }/samba4/x86_64-cache.txt (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
