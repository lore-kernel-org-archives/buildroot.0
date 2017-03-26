From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 12:32:49 +0200
Subject: [Buildroot] [PATCH 1/2] slang: use correct ncurses config
 script name
In-Reply-To: <20170326063654.10068-1-rprebello@gmail.com>
References: <20170326063654.10068-1-rprebello@gmail.com>
Message-ID: <20170326123249.72c4f006@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Mar 2017 03:36:53 -0300, Rodrigo Rebello wrote:
> The ncurses config script can have different names depending on the
> configuration (e.g. wchar support enabled/disabled). So, use
> $(NCURSES_CONFIG_SCRIPTS) from the ncurses package as it contains the
> proper name.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c97554c05e121c76407be53ba37924cfcb658e9d/
>   http://autobuild.buildroot.net/results/b0a31a3491a30ee0d6e6e7dbba68a86f0e00943d/
>   http://autobuild.buildroot.net/results/a77241141cf8710fa945523ef62327798e3c4824/
>   [...]
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  package/slang/slang.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
