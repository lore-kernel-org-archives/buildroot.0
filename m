From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 16:38:32 +0200
Subject: [Buildroot] [PATCH 00/10] Proposals of deprecation/removal,
	mainly affecting toolchain
In-Reply-To: <53B3073B.8090005@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 01 Jul 2014 16:08:43 -0300")
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53B3073B.8090005@zacarias.com.ar>
Message-ID: <87zjghnus7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> - Removal of busybox version selection

 > All of these should follow the deprecation guidelines i think?
 > Busybox in particular should keep at least a previous version around,
 > because there have been cases of .0 releases being quite broken.
 > Maybe patches show up soon but they don't follow a release schedule like
 > we do and there could be problems with that.

True, but I still don't recall ever having to go back to any of the
older versions. If it is really bad, then we can naturally wait with the
bump and/or temporary revert.

-- 
Bye, Peter Korsgaard
