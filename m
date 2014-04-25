From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Apr 2014 10:57:56 +0200
Subject: [Buildroot] [PATCH] evemu: bump version to 1.2.0
In-Reply-To: <1398203237-11976-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Tue, 22 Apr 2014 23:47:17 +0200")
References: <1398203237-11976-1-git-send-email-ps.report@gmx.net>
Message-ID: <87r44lzsyz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 >  package/evemu/evemu.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
 > index 38b792d..df9aea1 100644
 > --- a/package/evemu/evemu.mk
 > +++ b/package/evemu/evemu.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -EVEMU_VERSION = 1.0.10
 > +EVEMU_VERSION = 1.2.0

Committed with some changes:

- It explicitly defined SYN_MAX, but modern (3.12+) kernels already
  export that to user space

- The tests now need C++ support, even though evemu itself doesn't, so I
  disabled the tests.

Thanks.

-- 
Bye, Peter Korsgaard
