From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 16:52:08 +0200
Subject: [Buildroot] [PATCH] linux: replace shell for loop with make
 foreach loop
In-Reply-To: <20180816204523.7805-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 16 Aug 2018 22:45:23 +0200")
References: <20180816204523.7805-1-thomas.petazzoni@bootlin.com>
Message-ID: <871saxcag7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit replaces the loop copying out-of-tree DTS into the kernel
 > tree by a make foreach loop instead of a shell for loop. This allows
 > to error out if one of the DTS file cannot be copied (for example if
 > it doesn't exist).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
