From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Mar 2018 10:43:23 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets: bump to v2.4.2
In-Reply-To: <20180315125535.14667-1-aduskett@gmail.com> (Adam Duskett's
 message of "Thu, 15 Mar 2018 08:55:35 -0400")
References: <20180315125535.14667-1-aduskett@gmail.com>
Message-ID: <87lgesgxtw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Also add hash for license.
 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

I had a quick look at the changelog:

https://github.com/warmcat/libwebsockets/blob/v2.4-stable/changelog

It seems there is now medtls, http/2 and libevent support. It would be
good to handle those in libwebsockets.mk - Could you send patches for
that?

Thanks.

-- 
Bye, Peter Korsgaard
