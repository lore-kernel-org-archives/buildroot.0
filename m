From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Dec 2013 22:21:58 +0100
Subject: [Buildroot] [PATCH 3/4] package/dvb-apps: bump version
In-Reply-To: <529CF850.9020907@mind.be>
References: <cover.1385937338.git.yann.morin.1998@free.fr>
 <8ff24edea518d291706dddec42aa360cef4176ed.1385937338.git.yann.morin.1998@free.fr>
 <529CF850.9020907@mind.be>
Message-ID: <20131202212158.GA7738@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-12-02 22:14 +0100, Arnout Vandecappelle spake thusly:
> On 01/12/13 23:36, Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >Fixes for scanning DVBS, misc compiler warnings suppressed.
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >---
> >  package/dvb-apps/dvb-apps.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
> >index 8cf6a79..e351258 100644
> >--- a/package/dvb-apps/dvb-apps.mk
> >+++ b/package/dvb-apps/dvb-apps.mk
> >@@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> >-DVB_APPS_VERSION        = 83c746462ccb
> >+DVB_APPS_VERSION        = be76da69f250
> 
>  Didn't we agree to switch to full 40-character hashes? If it goes for git,
> it goes for hg as well, right? :-)

Yes, but that's all what Hg is giving me:
    $ hg id -i
    be76da69f250

OK, I got the full node, now:
    $ hg log -r tip --template '{node}\n'
    be76da69f250c4b96c4bc10cabafb061d299572e

Doh... :-(

OK, next time I bump it, I'll (try to remember to) use the full node.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
