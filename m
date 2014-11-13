From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 10:06:21 +0100
Subject: [Buildroot] [PATCH] schifra: mark as broken
In-Reply-To: <1415530410-18824-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Nov 2014 11:53:30 +0100")
References: <1415530410-18824-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874mu3jwqa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > There are many build failures caused by schifra, due to upstream
 > changing the tarball without doing new releases. Since has been an
 > on-going problem for some time, and is now the #1 issue in the
 > autobuilders. So let's mark this package broken, until someone cares
 > enough to fix it, or until we remove it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
