From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2015 22:16:06 +0100
Subject: [Buildroot] [PATCH 1/3] libsigc: bump to version 2.6.2
In-Reply-To: <1447437956-13035-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 13 Nov 2015 15:05:54 -0300")
References: <1447437956-13035-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ziyhlhwp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/libsigc/Config.in    | 5 +++--
 >  package/libsigc/libsigc.hash | 4 ++--
 >  package/libsigc/libsigc.mk   | 4 ++--
 >  3 files changed, 7 insertions(+), 6 deletions(-)

 > diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
 > index ae984c8..41ea19e 100644
 > --- a/package/libsigc/Config.in
 > +++ b/package/libsigc/Config.in
 > @@ -1,5 +1,6 @@
 >  config BR2_PACKAGE_LIBSIGC
 >  	bool "libsigc++"
 > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11

Why is this 4.7 and the other two patches 4.8? A note about that in the
commit message would be good.

-- 
Bye, Peter Korsgaard
