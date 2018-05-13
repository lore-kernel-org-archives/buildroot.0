From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:08:02 +0200
Subject: [Buildroot] [PATCH 1/1] woff2: fix build on m68k
In-Reply-To: <20180510101101.22094-1-fontaine.fabrice@gmail.com>
References: <20180510101101.22094-1-fontaine.fabrice@gmail.com>
Message-ID: <20180513220802.0c4958e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Waldemar in Cc, since he reported this issue to gcc.

On Thu, 10 May 2018 12:11:01 +0200, Fabrice Fontaine wrote:
> Same issue on woff2 than in some other packages such as lcdapi: see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/6c97a08e6ca2e914d54fbb525b3f0bb90023ef07
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/woff2/woff2.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

I've applied to master, but as Yann pointed out, it starts to be a
problem affecting a number of packages.

The bug report you point out at
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509 has been closed,
because they say the issue is on binutils side. Has the issue been
reported to binutils ? Could you try to make this issue move forward ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
