From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 13:20:36 +0100
Subject: [Buildroot] [PATCH 3/3] lttng-modules: bump to version 2.7.0
In-Reply-To: <1448566925-4643-4-git-send-email-eeppeliteloop@gmail.com>
 (eeppeliteloop@gmail.com's message of "Thu, 26 Nov 2015 14:42:05
 -0500")
References: <1448566925-4643-1-git-send-email-eeppeliteloop@gmail.com>
 <1448566925-4643-4-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <87k2p3skff.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "eeppeliteloop" == eeppeliteloop  <eeppeliteloop@gmail.com> writes:

 > From: Philippe Proulx <eeppeliteloop@gmail.com>
 > Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
 > ---
 >  package/lttng-modules/lttng-modules.hash | 5 +++--
 >  package/lttng-modules/lttng-modules.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 3 deletions(-)

 > diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
 > index 918b4cf..b1a14e8 100644
 > --- a/package/lttng-modules/lttng-modules.hash
 > +++ b/package/lttng-modules/lttng-modules.hash
 > @@ -1,2 +1,3 @@
 > -# http://www.lttng.org/files/lttng-modules/lttng-modules-2.6.0.tar.bz2.sha1
 > -sha1  6402ec848e2a75250e04be35f0c49332bf37a388  lttng-modules-2.6.0.tar.bz2
 > +# http://www.lttng.org/files/lttng-modules/lttng-modules-2.7.0.tar.bz2.sha1
 > +sha1  b98b85cd71c03d511b37790644353c7209bcadd4  lttng-modules-2.7.0.tar.bz2
 > +

Don't add an extra newline here.

Committed series to next after fixing this, thanks.

-- 
Bye, Peter Korsgaard
