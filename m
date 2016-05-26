From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 10:36:20 +0200
Subject: [Buildroot] [PATCH 2/2] boards: add roseapple pi board support
In-Reply-To: <1464010429-3604-2-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Mon, 23 May 2016 15:33:49 +0200")
References: <1464010429-3604-1-git-send-email-peter@korsgaard.com>
 <1464010429-3604-2-git-send-email-peter@korsgaard.com>
Message-ID: <87fut56wsb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Add basic support for the roseapple pi board, a SBC in a RPI form factor
 > with an Actions Semiconductor S500 SoC. For details, see:

 > http://roseapplepi.org/

 > The vendor kernel unfortunately needs a minor patch to build the XHCI
 > driver, so include it here.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to next, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
