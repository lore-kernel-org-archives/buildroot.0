From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:31:07 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/abootimg: fix host build
In-Reply-To: <20201120220949.603454-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 20 Nov 2020 23:09:49 +0100")
References: <20201120220949.603454-1-fontaine.fabrice@gmail.com>
Message-ID: <871rglwjis.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 05b11e24c3d4013d3caa0453d9bada9905795e35 wrongly added
 > ABOOTIMG_HOST_DEPENDENCIES instead of HOST_ABOOTIMG_DEPENDENCIES

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c13b5424cec151cd3ad71b1cb38d6ad8ff68afa0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
