From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Mar 2015 22:02:56 +0100
Subject: [Buildroot] [PATCH 6/7] package/efl/libevas: add optional
	dependency libfribidi
In-Reply-To: <1425028764-1146-7-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Fri, 27 Feb 2015 10:19:23 +0100")
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
 <1425028764-1146-7-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <878ufgxwfz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Fix the following message when libfribidi is enabled but not already
 > built:
 > Package fribidi was not found in the pkg-config search path.
 > Perhaps you should add the directory containing `fribidi.pc'
 > No package 'fribidi' found

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
