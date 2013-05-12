From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 May 2013 22:21:03 +0200
Subject: [Buildroot] [PATCH 00/12] Add license informations to X.org
	stack
In-Reply-To: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 9 May 2013 17:50:55 +0200")
References: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761yovtjk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Hello,

 Thomas> This set of patches adds license informations to all packages
 Thomas> in package/x11r7 as well as a few other packages that are
 Thomas> dependencies of the X.org server.

Committed series, thanks.

 Thomas> The most annoying packages are the xfont_* ones, still they
 Thomas> have very varying licenses. Those ones should certainly be the
 Thomas> one that should be reviewed the most carefully.

 Thomas> Generally speaking, I'm wondering if it's really necessary to
 Thomas> have all those font packages. Do people actually use those old
 Thomas> X.org fonts?

Sorry, no idea. I guess most of them aren't used.

-- 
Bye, Peter Korsgaard
