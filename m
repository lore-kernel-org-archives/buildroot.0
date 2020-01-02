From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:26:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: AD DC needs python3
In-Reply-To: <20200101175615.2525028-1-fontaine.fabrice@gmail.com>
References: <20200101175615.2525028-1-fontaine.fabrice@gmail.com>
Message-ID: <20200102092620.64911de0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  1 Jan 2020 18:56:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python3 is mandatory since version 4.11 and
> https://gitlab.com/samba-team/samba/commit/63d20d7822ead1626f7cb41fdbae6c9300893314
> 
> As a result, AD DC needs python3
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7af629b8acc92c81e006b1b87ae9a6fd461cf96d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/samba4/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks. Could you have a look at the discussion we
had at
http://lists.busybox.net/pipermail/buildroot/2019-November/266145.html
on the topic of Samba4 use of Python, and see if we have now taken into
account all what Trent Piepho reported back then ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
