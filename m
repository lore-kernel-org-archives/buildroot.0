From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 May 2021 08:57:42 +0200
Subject: [Buildroot] [PATCH] package/openjdk: drop patch left over after
 last bump
In-Reply-To: <20210430203635.2605171-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 30 Apr 2021 22:36:35 +0200")
References: <20210430203635.2605171-1-yann.morin.1998@free.fr>
Message-ID: <87im436ivt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 5871e278f873 (package/openjdk{, -bin}: security bump to version
 > 11.0.11_9) forgot to account for the openjdk patch in the versioned
 > directory.

 > That patch was a collection of backports from upstream ,that are now all
 > present in 11.0.11+9, so drop that patch.

 > Fixes: 5871e278f873
 > Reported-by: Adam Duskett <aduskett@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Ups - Committed, thanks.

Adam: I see that java 14 is EOL. It would be great if you could bump
OPENJDK_VERSION_LATEST to the 16.x series:

https://adoptopenjdk.net/support.html

-- 
Bye, Peter Korsgaard
