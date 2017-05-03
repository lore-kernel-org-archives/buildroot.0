From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 May 2017 17:25:52 +0200
Subject: [Buildroot] [PATCH 2/2] picocom: force target LDFLAGS
In-Reply-To: <f7abac9c0ca017bffd3109f7df0d6bfa7f099281.1493815595.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 3 May 2017 15:46:35 +0300")
References: <04e1e4d95a425dfc0e0650088cb0120a9f3e46a8.1493815595.git.baruch@tkos.co.il>
 <f7abac9c0ca017bffd3109f7df0d6bfa7f099281.1493815595.git.baruch@tkos.co.il>
Message-ID: <87h912c67z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > This allows a static build of picocom when BR2_STATIC_LIBS=y but the toolchain
 > provides static and shared libraries.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

Is this only an issue for picocom 2.2, or also something we should
backport for the 2017.02.x branch?

-- 
Bye, Peter Korsgaard
