From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 3 Mar 2014 13:50:01 +0200
Subject: [Buildroot] [PATCH] samba4: fix readline support
In-Reply-To: <1393847052-13062-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393847052-13062-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140303115001.GS3874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Mon, Mar 03, 2014 at 08:44:12AM -0300, Gustavo Zacarias wrote:
> Add automatic readilne support since it's used when available.

s/readilne/readline/

> Also add a patch to update to new-style typedefs that were removed from
> readline 6.3 that causes build breakage. Fixes:
> http://autobuild.buildroot.net/results/b13/b137c237ff6df81dd10f7895278d1f2f5d2326de/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
