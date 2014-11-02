From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2014 22:25:14 +0100
Subject: [Buildroot] [PATCH 3/3] arc: add support of ARC HS38 core
In-Reply-To: <1414677449-15937-4-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Thu, 30 Oct 2014 16:57:29 +0300")
References: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
 <1414677449-15937-4-git-send-email-abrodkin@synopsys.com>
Message-ID: <87zjc947np.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Synopsys has recently announced its new ARC HS38 core that is capable of
 > running Linux -
 > http://www.synopsys.com/dw/ipdir.php?ds=arc-hs38-processor

 > ARC HS38 is based on ARCv2 ISA and requires special settings of gcc and
 > libc.

 > Also in case of HS38 atomic extensions (LLOCK/SCOND instructions) are
 > built-in by default, so enabling atomic extensions in Buildroot as well.

 > This commit adds support of the core in buildroot.

Committed with quotes added as noted by Yann, thanks.

-- 
Bye, Peter Korsgaard
