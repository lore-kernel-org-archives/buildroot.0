From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jul 2008 16:00:53 +0200
Subject: [Buildroot] which build .patch
In-Reply-To: <bbbeeccd0807211543l286551abnb421aa890a294533@mail.gmail.com>
	(Wade Berrier's message of "Mon\, 21 Jul 2008 16\:43\:31 -0600")
References: <bbbeeccd0807211543l286551abnb421aa890a294533@mail.gmail.com>
Message-ID: <87zloa6msq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wade" == Wade Berrier <wberrier@gmail.com> writes:

Hi,

 Wade> Hi, 'which' depends on readline.  Attached is a patch to force
 Wade> that dep in buildroot.

Thanks - Committed as r22913.

Notice that your patch didn't apply anymore as we recently removed the
redundant 'default n' lines. Please create patches against latest
trunk.

-- 
Bye, Peter Korsgaard
