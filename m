From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 09:01:43 +0100
Subject: [Buildroot] [PATCH 1/5] coreutils: belongs to system tools,
	not development
In-Reply-To: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 2 Dec 2013 07:49:24 -0300")
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zjoipdlk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/Config.in | 4 +---
 >  1 file changed, 1 insertion(+), 3 deletions(-)

 > diff --git a/package/Config.in b/package/Config.in
 > index e2ca8ee..a65ceac 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -86,9 +86,6 @@ source "package/bison/Config.in"
 >  source "package/bsdiff/Config.in"
 >  source "package/bustle/Config.in"
 >  source "package/ccache/Config.in"
 > -if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 > -source "package/coreutils/Config.in"
 > -endif

Committed, thanks.

I'm really starting to think we should get rid of
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, or atleast make it default y.

Comments, anybody?

-- 
Bye, Peter Korsgaard
