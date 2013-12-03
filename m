From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 09:09:36 +0100
Subject: [Buildroot] [PATCH 4/5] zsh: alpha sort menu option
In-Reply-To: <1385981368-2235-4-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 2 Dec 2013 07:49:27 -0300")
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
 <1385981368-2235-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87iov6pd8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/Config.in | 4 +++-
 >  1 file changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/package/Config.in b/package/Config.in
 > index a65ceac..e70a58c 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -932,7 +932,6 @@ source "package/at/Config.in"
 >  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 >  source "package/bash/Config.in"
 >  source "package/dash/Config.in"
 > -source "package/zsh/Config.in"

You are right, certainly - But I think it is more userfriendly to make
an exception and keep all the shells together.

What do others think?

-- 
Bye, Peter Korsgaard
