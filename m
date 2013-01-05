From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jan 2013 22:51:45 +0100
Subject: [Buildroot] [PATCH] xorg-release: ignore some X.org packages
In-Reply-To: <1357414005-9612-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 5 Jan 2013 20:26:45 +0100")
References: <1357414005-9612-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9sni9hq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Following Gustavo's removal of two X.org drivers for old hardware
 Thomas> unlikely to be used in embedded contexts, the xorg-release script now
 Thomas> reports those two X.org packages as "to be added": they exist in
 Thomas> X.org, but not in Buildroot.

 Thomas> So, we add a small list, XORG_EXCEPTIONS, in our xorg-release script,
 Thomas> to list the X.org packages we don't want to hear about. Of course,
 Thomas> packages that exist in X.org, and that are not part of this exception
 Thomas> list, and are not packaged in Buildroot are still listed as "to be
 Thomas> added".

Committed, thanks.

-- 
Bye, Peter Korsgaard
