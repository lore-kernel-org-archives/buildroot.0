From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Mar 2018 22:17:42 +0100
Subject: [Buildroot] [PATCH 01/19] package/libdrm: bump version to 2.4.91
In-Reply-To: <20180307205844.3240-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 7 Mar 2018 21:58:26 +0100")
References: <20180307205844.3240-1-bernd.kuhls@t-online.de>
Message-ID: <87sh9bmvpl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/libdrm/libdrm.hash | 10 +++++-----
 >  package/libdrm/libdrm.mk   |  2 +-
 >  2 files changed, 6 insertions(+), 6 deletions(-)

 > diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
 > index b1784b4c07..bc15ecf79f 100644
 > --- a/package/libdrm/libdrm.hash
 > +++ b/package/libdrm/libdrm.hash
 > @@ -1,5 +1,5 @@
 > -# From https://lists.x.org/archives/xorg-announce/2018-February/002838.html
 > -md5 61dcb4989c728f566e3c15c236585a17  libdrm-2.4.90.tar.bz2
 > -sha1 7630ba36c65433251a0494b47086fbd0b32ff7a8  libdrm-2.4.90.tar.bz2
 > -sha256 db37ec8f1dbaa2c192ad9903c8d0988b858ae88031e96f169bf76aaf705db68b  libdrm-2.4.90.tar.bz2
 > -sha512
 > 3d32d60c44ffdcb58667d0926e6af8d375332add1f243d8b2d37567aeef4e4b26d786294aeecf46c3dea94fc002fb73756567c457300703acfc21e32ffbd458c

Hmm, did you do anything special when sending this patch? I see that it
claims to be sent with git-send-email, but it is word wrapped?

Anyway, committed after fixing up the word wrapping - Thanks.

-- 
Bye, Peter Korsgaard
