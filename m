From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jul 2014 16:13:29 +0200
Subject: [Buildroot] [PATCH] binutils: disable makeinfo
In-Reply-To: <1404147757-23849-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Mon, 30 Jun 2014 21:02:37 +0400")
References: <1404147757-23849-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87simlf9py.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > makeinfo is known to cause problems when building old texi files with more
 > recent host makeinfo.

 > In particular binutils-2.18 won't build on Fedora 20 without this change.

 > Even though more up to date binutils does build without this change there's
 > no guaranty it will with bump of host makeinfo in the future.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
