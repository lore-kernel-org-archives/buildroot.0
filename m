From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 May 2013 21:00:00 +0200
Subject: [Buildroot] [PATCH 1/6] bzip2: improve the packaging
In-Reply-To: <1369695664-5670-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 01:00:59 +0200")
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v2z9bgv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Instead of doing some nasty SED tricks, use a patch that modifies the
 Thomas> bzip2 build system to make it a little bit nicer. Those SEDs were made
 Thomas> differently for the host and target packages, which is contrary to the
 Thomas> logic of not having any difference in the source tree between the host
 Thomas> build and the target build.

 Thomas> This commit also makes sure that bzip2.mk behaves properly in a
 Thomas> BR2_PREFER_STATIC_LIB=y context.

Committed to next, thanks.

It would be good if you could try to push the patch upstream.

-- 
Bye, Peter Korsgaard
