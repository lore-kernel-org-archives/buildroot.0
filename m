From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Jan 2014 14:24:44 +0100
Subject: [Buildroot] [PATCH 2/2] sdl: Fix compilation with libX11 >=
	1.5.99.902
In-Reply-To: <52CE9FA6.2020909@imgtec.com> (Vicente Olivert Riera's message of
 "Thu, 9 Jan 2014 13:09:58 +0000")
References: <1389268653-45909-1-git-send-email-Vincent.Riera@imgtec.com>
 <1389268653-45909-2-git-send-email-Vincent.Riera@imgtec.com>
 <87lhype3bi.fsf@dell.be.48ers.dk> <52CE9FA6.2020909@imgtec.com>
Message-ID: <87d2k1e19f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 >> Hmm, this ends up relying on the use having compatible auto* tools
 >> installed on the build machine. Are you sure we cannot use our
 >> pkg_AUTORECONF = YES handling?

 > I tried it but I can't get it working properly. Maybe you could try it.

ok, I'll take a look.


 >> Alternatively, it should depend on
 >> host-automake host-autoconf host-libtool so we build our own versions of
 >> the tools, similar to how AUTORECONF does.

 > So, what do you want I do, sending an updated patch adding those
 > dependencies, or do you prefer to try to use the pkg_AUTORECONF = YES
 > way?

I'll handle it. Thanks.

-- 
Bye, Peter Korsgaard
