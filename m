From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Feb 2017 21:54:48 +0100
Subject: [Buildroot] [PATCH 1/1] json-c: bump to version 0.12.1-20160607
In-Reply-To: <1487214867-3088-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Wed, 15 Feb 2017 22:14:27 -0500")
References: <1487214867-3088-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87ino9g8kn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Also, change the SITE of this version from the github helper to the release
 > tarball URL, as suggested by the buildroot manual.

This should only be done for manually uploaded tarballs, which as far as
I can see isn't the case here.

Committed to next after reverting back to the github helper, thanks.

-- 
Bye, Peter Korsgaard
