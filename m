From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 21:53:17 +0100
Subject: [Buildroot] [pull request v6] Pull request for branch
	yem-root-passwd
In-Reply-To: <cover.1357397453.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 5 Jan 2013 15:52:01 +0100")
References: <cover.1357397453.git.yann.morin.1998@free.fr>
Message-ID: <87ip7af2yq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Hello All!
 Yann> Here's a re-spin of the second-part of the 'root-paswd' series.


 Yann> Changes v5 -> v6:
 Yann>   - set root password only for default skeleton, not for custom one (Gustavo)
 Yann>   - rebase on-top current master

 Yann> Changes v4 -> v5:
 Yann>   - drop patch #1, applied upstream (Peter)
 Yann>   - make the password-encoding scheme generic (ie. not root-speific)
 Yann>   - rebase on-top current master

Committed series, thanks.

-- 
Bye, Peter Korsgaard
