From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 May 2014 16:13:30 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: fix fontrootdir
	configuration
In-Reply-To: <1399989589-3731-1-git-send-email-filippo.sironi@gmail.com>
 (Filippo Sironi's message of "Tue, 13 May 2014 15:59:49 +0200")
References: <1399989589-3731-1-git-send-email-filippo.sironi@gmail.com>
Message-ID: <87lhu1reut.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Filippo" == Filippo Sironi <filippo.sironi@gmail.com> writes:

 > The --with-fontdir switch has been substituted by the --with-fontrootdir
 > switch a few versions ago. The use of the old configuration switch was
 > causing error messages like the following:

 > _FontTransOpen: Unable to Parse address ${prefix}/share/fonts/X11/*/
 > [dix] Could not init font path element ${prefix}/share/fonts/X11/*/, removing from list!

 > Signed-off-by: Filippo Sironi <filippo.sironi@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
