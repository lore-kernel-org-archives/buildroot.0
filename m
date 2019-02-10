From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Feb 2019 10:51:59 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libopenssl: add runtime
 fixes for tor
In-Reply-To: <20190209161953.30820-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 9 Feb 2019 17:19:53 +0100")
References: <20190209161953.30820-1-bernd.kuhls@t-online.de>
Message-ID: <874l9cx96o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > For details see https://bugs.archlinux.org/task/61623
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: split upstream patches (Peter)

Committed, thanks.

Your v1 patch had 4 patches in a single file, but now you are only
adding 2 patches? Are the other 2 not needed?

-- 
Bye, Peter Korsgaard
