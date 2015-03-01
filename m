From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Mar 2015 22:03:10 +0100
Subject: [Buildroot] [PATCH 7/7] package/libfribidi: add optional
	dependency libglib2
In-Reply-To: <1425028764-1146-8-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Fri, 27 Feb 2015 10:19:24 +0100")
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
 <1425028764-1146-8-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <874mq4xwfl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Fix the following message when libglib2 is enabled but not already
 > built:
 > Package glib-2.0 was not found in the pkg-config search path.
 > Perhaps you should add the directory containing `glib-2.0.pc'
 > No package 'glib-2.0' found

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
