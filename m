From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 21:49:47 +0100
Subject: [Buildroot] [PATCH] coreutils: avoid prompt on rebuild
In-Reply-To: <4ec5cf7dfd067f650364a485e746d1c97021e729.1416337648.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 18 Nov 2014 21:07:28 +0200")
References: <4ec5cf7dfd067f650364a485e746d1c97021e729.1416337648.git.baruch@tkos.co.il>
Message-ID: <87lhn8p72s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The mode bits of coreutils installed binaries are 555. As a result, on
 > rebuild mv prompts the user to confirm overwrite of non writable binaries.
 > Force overwrite to skip this prompt.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
