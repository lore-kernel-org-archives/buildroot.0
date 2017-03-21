From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Mar 2017 22:15:35 +0100
Subject: [Buildroot] [PATCH] support/check-bin-arch: fix for filenames
	with spaces
In-Reply-To: <1490122885-12902-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 21 Mar 2017 20:01:25 +0100")
References: <1490122885-12902-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87r31qjpqg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Filenames with spaces will break the current for loop.
 > Fix that by using a while-read loop, fed with the list of files on
 > stdin, using process substitution.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  support/scripts/check-bin-arch | 10 ++++++----
 >  1 file changed, 6 insertions(+), 4 deletions(-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
