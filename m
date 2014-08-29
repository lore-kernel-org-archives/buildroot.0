From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Aug 2014 09:16:07 +0200
Subject: [Buildroot] [PATCH 1/3] ruby: requires shared library
In-Reply-To: <1409264259-13058-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 29 Aug 2014 00:17:37 +0200")
References: <1409264259-13058-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1409264259-13058-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738cfsr48.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Not matter what you do, the Ruby build system wants to use shared
 > libraries for the encoding modules. Therefore, this commit disallows
 > the selection of Ruby in BR2_PREFER_STATIC_LIB situations.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
