From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2014 22:24:35 +0100
Subject: [Buildroot] [PATCH 2/3] uclibc: add explicit setup of
	ARC-specific options
In-Reply-To: <1414677449-15937-3-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Thu, 30 Oct 2014 16:57:28 +0300")
References: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
 <1414677449-15937-3-git-send-email-abrodkin@synopsys.com>
Message-ID: <874muh5m98.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > As with other architectures for ARC we need to have an ability to set
 > specific options in uClibc.

 > In particular this is required for selection of ARC ISA version.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Committed with quotes added as noted by Yann, thanks.

-- 
Bye, Peter Korsgaard
