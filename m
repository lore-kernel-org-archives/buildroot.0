From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2015 09:41:59 +0100
Subject: [Buildroot] [PATCH v1] fbgrab: bump verstion to 1.3
In-Reply-To: <1447456618-4352-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Sat, 14 Nov 2015 00:16:58 +0100")
References: <1447456618-4352-1-git-send-email-ps.report@gmx.net>
Message-ID: <87k2plj7l4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Changelog (see [1] for details):
 >   - Added support when active framebuffer is not starting at offset 0
 >   - Fixed broken re-ordering of colors, rgba to argb
 >   - Fixed broken path for man page

 > [1] http://fbgrab.monells.se

Committed to next, thanks.

Could you try submitting 0001-fix-static-build.patch upstream, please?

-- 
Bye, Peter Korsgaard
