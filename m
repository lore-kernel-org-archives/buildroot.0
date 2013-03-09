From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 22:27:55 +0100
Subject: [Buildroot] [PATCH 07/32] jpeg: convert to a real package
In-Reply-To: <1362687540-19440-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:18:35 +0100")
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362687540-19440-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87txokz2jo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> jpeg is a virtual package, but since it is listed in the dependencies
 Thomas> of other packages, it should obey to all the normal make rules for
 Thomas> packages. Notably, the jpeg-show-depends target is mandatory for the
 Thomas> graph-depends script to work.

 Thomas> Instead to implement such a make target manually, make jpeg a normal
 Thomas> generic-package, except that it doesn't have any source.

Committed, thanks.

-- 
Bye, Peter Korsgaard
