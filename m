From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jan 2018 15:07:34 +0100
Subject: [Buildroot] [PATCH 1/1] tcf-agent: disable package for
 microblaze
In-Reply-To: <20180105215017.5537-1-nolange79@gmail.com>
References: <20180105215017.5537-1-nolange79@gmail.com>
Message-ID: <20180106150734.36a01e20@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Jan 2018 22:50:17 +0100, Norbert Lange wrote:
> for now, tcf-agent fails to build on microblaze.
> Disable microblaze until upstream is fixed.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/tcf-agent/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I've added a reference to an autobuilder failure that this patch is
fixing, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
