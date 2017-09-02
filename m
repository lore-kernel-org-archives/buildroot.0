From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:49:30 +0200
Subject: [Buildroot] [PATCH v5] util-linux: add menu items for login
 utilities
In-Reply-To: <20170902004138.17967-1-casantos@datacom.ind.br>
References: <20170825212645.1467-1-casantos@datacom.ind.br>
 <20170902004138.17967-1-casantos@datacom.ind.br>
Message-ID: <20170902224930.26add89b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Sep 2017 21:41:38 -0300, Carlos Santos wrote:
> This change extends to the login utilities the current policy of having
> a selection item in the configuration menu for each utility that has an
> --enable/--disable knob in the "configure" script:
> 
> - add selection items for login, runuser, su and sulogin (there was
>   already an item for "last")
> - move "login utilities" to Config.in.legacy
> - make "login utilities" select last, login, runuser, su and sulogin
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> ---
> Changes v1->v2
>   - do not add section titles
>   - deprecate the "login utilities" group
> Changes v2->v3
>   - improve comments
>   - fix spelling errors
>   - add comment to show when "login" is unavailable
> Changes v3->v4
>   - install PAM files only if linux-pam is selected
> Changes v4->v5
>   - Fix merge conflict in Config.in.legacy
> ---
>  Config.in.legacy                 | 15 ++++++++++++++
>  package/util-linux/Config.in     | 45 ++++++++++++++++++++++++++++------------
>  package/util-linux/util-linux.mk | 10 +++++----
>  3 files changed, 53 insertions(+), 17 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
