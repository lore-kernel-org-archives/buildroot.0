From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Nov 2013 13:45:16 +0100
Subject: [Buildroot] [pull request for next] Pull request for branch
	yem/kconfig
In-Reply-To: <cover.1384386575.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 14 Nov 2013 00:53:32 +0100")
References: <cover.1384386575.git.yann.morin.1998@free.fr>
Message-ID: <87habf17ab.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Hello All!

 > While I was at it to fix the kconfig space-can't-deselect issue, I
 > decided to go a bit further, and update and clean up our kconfig.

 > So here is this series for 'next'.

 > Note that we ditch two of our patches: one because it is useless
 > (C++-style comments), one because it's been upstreamed (probability).
 > Also, the README was updated to also include copying of .gitignore,
 > which was missing so far.

Committed to next, thanks. I will cherry pick patch 1 to master in a day
or two as well if no problems are noticed.

-- 
Bye, Peter Korsgaard
