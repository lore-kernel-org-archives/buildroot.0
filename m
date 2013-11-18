From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Nov 2013 22:01:29 +0100
Subject: [Buildroot] [PATCH]ttcp: fix url, rename patch
In-Reply-To: <1384702440-23840-1-git-send-email-arnaud.aujon@gmail.com>
 (Arnaud Aujon's message of "Sun, 17 Nov 2013 16:34:00 +0100")
References: <1384702440-23840-1-git-send-email-arnaud.aujon@gmail.com>
Message-ID: <87fvqtwhjq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnaud" == Arnaud Aujon <arnaud.aujon@gmail.com> writes:

 >  - fix download url : isn't available on previous ftp, use an other one instead
 >  - Add version according to source code version
 >  - rename and clean patch according to patch policy

You forgot to adjust the upstream URL in Config.in to match. Committed
with that fixed, thanks.

Are you using ttcp? We deprecated it some time ago, and I was thinking
about removing it - But if people are actually using it, then I will
certainly keep it.

-- 
Bye, Peter Korsgaard
