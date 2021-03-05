From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Mar 2021 13:22:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/intel-mediasdk: disable samples
 and tutorials
In-Reply-To: <20210222170048.409719-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 22 Feb 2021 18:00:48 +0100")
References: <20210222170048.409719-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8fxg58f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable samples and tutorials which are enabled by default and fail to
 > build with gcc 10 without upstream commit:
 > https://github.com/Intel-Media-SDK/MediaSDK/commit/c7d40371eb0c2042261fe1f91a364f69a1457235

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9ee28e5dc0b2ba854766d9bc82b95c28be2722d3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
