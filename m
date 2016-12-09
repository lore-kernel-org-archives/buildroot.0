From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Dec 2016 18:17:53 +0100
Subject: [Buildroot] [PATCH] sysstat: bump to version 11.4.2
In-Reply-To: <1481295149-1317-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 9 Dec 2016 11:52:29 -0300")
References: <1481295149-1317-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87h96df2da.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/sysstat/sysstat.hash | 2 +-
 >  package/sysstat/sysstat.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
 > index 3170fc9..e6e0c53 100644
 > --- a/package/sysstat/sysstat.hash
 > +++ b/package/sysstat/sysstat.hash
 > @@ -1,2 +1,2 @@
 >  # From: http://sebastien.godard.pagesperso-orange.fr/download.html
 > -sha1	59769deddef02acd60db3a42d772e57bd0978efb	sysstat-11.4.0.tar.xz
 > +sha1	84ac7feba76049f201e203c7ce0cc750479a9d43	sysstat-11.4.2.tar.xz

Committed after adding a sha256 hash as suggested by Vicente, thanks.

-- 
Bye, Peter Korsgaard
