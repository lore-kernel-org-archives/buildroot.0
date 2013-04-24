From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Apr 2013 22:09:34 +0200
Subject: [Buildroot] [PATCH 0/4] Wayland/weston packages
In-Reply-To: <20130424162316.223da5b4@skate> (Thomas Petazzoni's message of
 "Wed, 24 Apr 2013 16:23:16 +0200")
References: <1366646873-26196-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5175ACB8.4060405@mind.be> <20130424042732.2cbfdc43@skate>
 <5177D3C8.8020309@mind.be> <20130424162316.223da5b4@skate>
Message-ID: <874nevbsht.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> If it no longer depends on xorg7, I would vote to move it out.

 Thomas> It still depends on host-xapp_xkbcomp, but since it's a host
 Thomas> package, it can be used even if BR2_PACKAGE_XORG7 is not
 Thomas> enabled, which is why I could move the
 Thomas> xkeyboard-config/Config.in inclusion outside of the
 Thomas> BR2_PACKAGE_XORG7. The other dependencies are runtime
 Thomas> dependencies that are only needed in a X.org context.

Ok, sounds good.

-- 
Bye, Peter Korsgaard
