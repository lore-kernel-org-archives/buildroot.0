From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2016 19:46:05 +0100
Subject: [Buildroot] [PATCH] configs/arm_foundationv8: bump to Linux
	4.4.3
In-Reply-To: <1456486813-28269-1-git-send-email-yamada.masahiro@socionext.com>
 (Masahiro Yamada's message of "Fri, 26 Feb 2016 20:40:13 +0900")
References: <1456486813-28269-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <87twkvtimq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Masahiro" == Masahiro Yamada <yamada.masahiro@socionext.com> writes:

 > Bump to the latest kernel with DT path adjustment because Linux
 > commit ca5b34100c57 ("dts, arm64: Move dts files to vendor subdirs")
 > moved the DT file to the vendor sub-directory.

 > This commit was tested with the latest model (FVP v8 Foundation
 > Platform 9.5 build 41), so I updated the instruction in readme.txt
 > corresponding to it.

 > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
