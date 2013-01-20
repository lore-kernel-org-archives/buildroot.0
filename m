From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 20:51:56 +0100
Subject: [Buildroot] [PATCH 1/2] packages: remove all := signs
In-Reply-To: <1358711148-2283-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 20 Jan 2013 20:45:47 +0100")
References: <1358711148-2283-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3r7eioz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Finally get rid of all := used for variable definitions in packages,
 Thomas> as we suggest in our manual and during the review of new packages.

 Thomas> While I was at it, I also sometimes added a few missing new lines
 Thomas> between the header and the first variable definition.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
