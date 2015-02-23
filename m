From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Feb 2015 23:24:48 +0100
Subject: [Buildroot] [PATCH v3] python-cherrypy: new package
In-Reply-To: <1423411159-4560-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Sun, 8 Feb 2015 10:59:19 -0500")
References: <1423411159-4560-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <8761as9sgf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 > ---
 > Changes v2 -> v3:
 >   - Add runtime dependencies on zlib and expat
 >   - Add hash file
 > Changes v1 -> v2:
 >   - removed depends statement in Config.in per Yegor's comment
 >     that it wasn't needed if it runs on both Python 2 and 3.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
