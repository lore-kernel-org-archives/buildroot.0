From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Apr 2018 22:26:10 +0200
Subject: [Buildroot] [PATCH 1/2] procps-ng: fix build without wide
 character support
In-Reply-To: <cd7b2acad0806087a77f051a284df39802c8ff74.1524804032.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 27 Apr 2018 07:40:32 +0300")
References: <cd7b2acad0806087a77f051a284df39802c8ff74.1524804032.git.baruch@tkos.co.il>
Message-ID: <87604cz999.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Define OFF_XTRAWIDE to disable use of wchar API when the toolchain does
 > not support that.

 > Fixes:
 > http://autobuild.buildroot.net/results/b96/b96d29d64f455726a53a7adcfd3edd546346201c/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
