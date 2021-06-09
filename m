From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Jun 2021 22:49:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: fix mips32 build
In-Reply-To: <20210524210529.353499-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 24 May 2021 23:05:29 +0200")
References: <20210524210529.353499-1-fontaine.fabrice@gmail.com>
Message-ID: <87im2moj9z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build failure with mips32 which is raised since the addition of
 > bootlin toolchains

 > Fixes:
 >  - http://autobuild.buildroot.org/results/cba3e9d0fd061cc3a92cb732bcdc2c7b66dbf6cb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
