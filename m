From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 21:50:56 +0100
Subject: [Buildroot] [PATCH] package/tzdata: fix installation commands
In-Reply-To: <1416335907-10074-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 18 Nov 2014 19:38:27 +0100")
References: <1416335907-10074-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87h9xwp70v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > If the destination directory already exists (e.g. because of a re-run or
 > a custom skeleton), then the zoneinfo files will be installed in a
 > sub-directory of where we are trying to install them.

 > Fix that by creating the destination directory and copying the content
 > of the source directory.

 > Also fix the host install commands to match what we do in the target
 > install commands.

 > Reported-by: Martin Dorwig <dorwig@tetronik.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
