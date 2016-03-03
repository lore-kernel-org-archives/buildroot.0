From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Mar 2016 17:43:18 +0100
Subject: [Buildroot] [PATCH 0/2] board/boundarydevices: update platforms
	support
In-Reply-To: <1457017038-4023-1-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Thu, 3 Mar 2016 15:57:16 +0100")
References: <1457017038-4023-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <877fhj8qc9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Hi all,
 > Since the Nitrogen7 defconfig came in, someone pointed out that the
 > bootscript hasn't been updated accordingly so the first patch is taking
 > care of that.

 > While doing it, I realized it didn't really make sense to have all our
 > scripts in a 'nitrogen6x' folder whereas they also apply to other configs.
 > So the second patch renames the folder and also updates the readme so it is
 > (hopefully) clearer which config should be used depending on the platform
 > being used.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
