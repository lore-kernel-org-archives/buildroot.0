From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 May 2013 16:09:34 +0200
Subject: [Buildroot] [PATCH 20/20] network-manager: bump to 0.9.8.0
In-Reply-To: <1369606110-8088-21-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:30 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-21-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vc616foh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This upstream version (the latest available at the time of this
 Thomas> writing) contains
 Thomas> http://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f
 Thomas> which fixes a build issue of network-manager against recent kernel
 Thomas> headers.

 Thomas> We also remove our patch against network-manager, because it has been
 Thomas> merged upstream as commit cbf72aeb34a6f1fd1bcd7f78ae88985154dc85af.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
