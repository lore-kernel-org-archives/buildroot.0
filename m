From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 22:32:20 +0200
Subject: [Buildroot] [PATCH] snmppp: new package
In-Reply-To: <CAAXf6LU9vZRc1B1MeO717yutvHHeZVv7hrYAC22XDrwY8JzPxA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 14 Oct 2013 21:41:39
 +0200")
References: <1381758435-13669-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LU9vZRc1B1MeO717yutvHHeZVv7hrYAC22XDrwY8JzPxA@mail.gmail.com>
Message-ID: <87mwmboap7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 >> +
 >> +comment "snmp++ requires a toolchain with threads and C++ support enabled"
 >> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

 Thomas> This should now be:
 Thomas> snmp++ needs a toolchain w/ threads, C++

Ahh yes, sorry - Forgot, will fix.

 Thomas> See: http://patchwork.ozlabs.org/patch/283094/
 Thomas> (waiting to be merged, but discussed with Peter)

I'll get to it in a moment.

-- 
Bye, Peter Korsgaard
