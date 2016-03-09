From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 22:51:23 +0100
Subject: [Buildroot] [PATCH] toolchain: switch linaro to https urls
In-Reply-To: <20160309214256.GA5634@free.fr> (Yann E. MORIN's message of "Wed, 
 9 Mar 2016 22:42:56 +0100")
References: <1457552439-8185-1-git-send-email-jason.abele@gmail.com>
 <20160309214256.GA5634@free.fr>
Message-ID: <87vb4vxquc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Jason, All,
 > On 2016-03-09 11:40 -0800, Jason Abele spake thusly:
 >> From: Jason Abele <jason@nextthing.co>
 >> 
 >> Signed-off-by: Jason Abele <jason@nextthing.co>

 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 >> ---
 >> It looks like releases.linaro.org is no longer available without ssl.
 >> If this change is permanent, we should probably fix the urls.

 > Even if the http URLs return to operational in the future, we want
 > to keep the https ones anyway.

Do we? With the package hashes, https doesn't really buy anything, and
we sometimes have issues with certificates and (old versions) wget.

-- 
Bye, Peter Korsgaard
