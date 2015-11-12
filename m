From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2015 09:49:23 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
In-Reply-To: <20151112092820.4500de49@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 12 Nov 2015 09:28:20 +0100")
References: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
 <20151111235359.707acc35@free-electrons.com>
 <87si4bocvr.fsf@dell.be.48ers.dk>
 <20151112092820.4500de49@free-electrons.com>
Message-ID: <87oaezob58.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> Ahh. Debian 6.0 is getting quite old (2011), but yeah - People on
 >> Enterprise distributions might end up with the same problems.

 > Indeed, and that's why I'd like to keep my old distro.

Good!

 > So I guess that the only reasonable option here is that I had some
 > logic in autobuild-run to not use this toolchain when the host C
 > library is too old. This way, we keep using the Linaro toolchain on
 > build slaves that are modern enough, and we don't have build failures
 > on the others.

 > Thoughts?

Yes, that makes sense.

-- 
Venlig hilsen,
Peter Korsgaard 
