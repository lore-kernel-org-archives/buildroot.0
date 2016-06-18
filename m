From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:58:08 +0200
Subject: [Buildroot] [PATCH 01/19] package/apitrace: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com> (Romain
 Naour's message of "Sat, 18 Jun 2016 18:43:01 +0200")
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <87r3bu6wpr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Similar to jquery-keyboard, it seems the apitrace tarball on the
 > autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
 > our s.b.o mirror.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed series after verifying that the tarballs we have on s.b.o
matches the hashes, thanks!

-- 
Bye, Peter Korsgaard
