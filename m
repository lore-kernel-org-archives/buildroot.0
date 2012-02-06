From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 Feb 2012 22:07:44 +0100
Subject: [Buildroot] Help submitting patches
In-Reply-To: <CAC78Gpc2rZ8-9FjnkC=dNqAXBQ1pTSJ+yT0tdOtEzjEus7MmCQ@mail.gmail.com>
 (J. C. Woltz's message of "Mon, 6 Feb 2012 14:49:42 -0500")
References: <CAC78Gpc2rZ8-9FjnkC=dNqAXBQ1pTSJ+yT0tdOtEzjEus7MmCQ@mail.gmail.com>
Message-ID: <87aa4vvffj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J" == J C Woltz <jwoltz@gmail.com> writes:

 J> Please forgive my ignorance. I would like to submit some patches. I am using
 J> git. Can someone paste the commands to format patch and sign off?

git format-patch -s master

That is if you made your changes on a seperate branch like you should,
otherwise replace master with the commit id of the last change before
your local changes.

-- 
Bye, Peter Korsgaard
