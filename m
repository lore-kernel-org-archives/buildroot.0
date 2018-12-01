From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 22:14:58 +0100
Subject: [Buildroot] [PATCH/next 1/2] c-ares: use LICENSE.md
In-Reply-To: <20181201204246.9031-1-fontaine.fabrice@gmail.com>
References: <20181201204246.9031-1-fontaine.fabrice@gmail.com>
Message-ID: <20181201221458.2156b5ea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Dec 2018 21:42:45 +0100, Fabrice Fontaine wrote:
> c-ares has a LICENSE.md file since version 1.12 and
> https://github.com/c-ares/c-ares/commit/4e861351d9deaef7b78aee50ce9229325f4fc59a
> 
> So use it instead of one of the source file and add its hash
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/c-ares/c-ares.hash | 3 +++
>  package/c-ares/c-ares.mk   | 3 +--
>  2 files changed, 4 insertions(+), 2 deletions(-)

I'm not sure why you submitted this patch for next. This kind of
fix/improvement is definitely welcome in master, so I applied it to the
master branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
