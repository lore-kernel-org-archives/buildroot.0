From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:47:09 +0100
Subject: [Buildroot] [PATCH] linux-headers: remove 3.18.x and 4.8.x
 series
In-Reply-To: <20170302201829.22674-1-gustavo@zacarias.com.ar>
References: <20170302201829.22674-1-gustavo@zacarias.com.ar>
Message-ID: <20170312234709.6476f03b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Mar 2017 17:18:29 -0300, Gustavo Zacarias wrote:
> These aren't supported upstream any more so remove the options and add
> them to legacy handling.
> 
> Switch older deprecations that used 3.18.x to 3.12.x
> 
> Remove stray version strings as well.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  Config.in.legacy                     | 28 ++++++++++++++++++++++++----
>  package/linux-headers/Config.in.host | 13 -------------
>  2 files changed, 24 insertions(+), 17 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
