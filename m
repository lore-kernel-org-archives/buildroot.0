From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 11:28:06 +0100
Subject: [Buildroot] [PATCH] libpng: bump to version 1.6.9
In-Reply-To: <1393323836.10704.5.camel@sven> (Sven Neumann's message of "Tue, 
 25 Feb 2014 11:23:56 +0100")
References: <1393320628-10918-1-git-send-email-neumann@teufel.de>
 <874n3nld20.fsf@dell.be.48ers.dk> <1393323836.10704.5.camel@sven>
Message-ID: <87zjlfjxl5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:

 > Hi,
 > On Di, 2014-02-25 at 11:08 +0100, Peter Korsgaard wrote:
 >> >>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:
 >> 
 >> > This also fixes the download URL as oudated versions have been
 >> > moved to the "older-releases" sub-folder.
 >> 
 >> > Signed-off-by: Sven Neumann <neumann@teufel.de>
 >> 
 >> So is this something we want for 2014.02 or should be apply this to next
 >> and only change the _SITE on master?

 > I don't think the update is very important. There are no security issues
 > fixed as far as I can see. So the safest change would be to just fix the
 > download location on master and keep the update for next.

Ok, great. Care to send a patch doing that?

-- 
Bye, Peter Korsgaard
