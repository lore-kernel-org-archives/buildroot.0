From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 31 Jan 2013 14:14:08 +0100
Subject: [Buildroot] [PATCH] cjson: change source to svn repo
In-Reply-To: <1359602797-4498-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Wed, 30 Jan 2013 22:26:37 -0500")
References: <1359602797-4498-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87k3qt8pgf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> The original cJSON submittal downloaded a .zip file from SourceForge.
 Danomi> The .zip file did not have a version number, making it impossible
 Danomi> to gaurantee that the same archive is downloaded on any given build.
 Danomi> It also required a custom EXTRACT command.

 Danomi> This patch changes the source for cJSON to the svn repository
 Danomi> listed on the sf project web page - giving us an actual version
 Danomi> number, and letting us use buildroot's normal extraction
 Danomi> functionality.

Looks good, but you forgot your signed-off-by. Can I add it, please?

-- 
Bye, Peter Korsgaard
