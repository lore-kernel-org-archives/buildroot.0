From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Feb 2019 12:45:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/libopenssl: add runtime fixes
 for tor
In-Reply-To: <20190209101139.13168-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 9 Feb 2019 11:11:39 +0100")
References: <20190209101139.13168-1-bernd.kuhls@t-online.de>
 <20190209101139.13168-2-bernd.kuhls@t-online.de>
Message-ID: <87pns1xk1u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > For details see https://bugs.archlinux.org/task/61623

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>


Urgh, runtime issues :/ Lets hope nothing else got broken at runtime by
the version bump.

Committed, thanks.

-- 
Bye, Peter Korsgaard
