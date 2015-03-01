From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Mar 2015 22:02:49 +0100
Subject: [Buildroot] [PATCH 1/7] shared-mime-info: host variant requires
	libxml2 and libglib2
In-Reply-To: <1425028764-1146-2-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Fri, 27 Feb 2015 10:19:18 +0100")
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
 <1425028764-1146-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87d24sxwg6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Add to HOST_SHARED_MIME_INFO_DEPENDENCIES the missing dependencies
 > host-libxml2 and host-libglib2.

 > Also remove from SHARED_MIME_INFO_DEPENDENCIES dependencies already
 > present in HOST_SHARED_MIME_INFO_DEPENDENCIES.

 > Fix build failure:
 > configure: error: Package requirements ( libxml-2.0 >= 2.4 glib-2.0 >= 2.6.0) were not met

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
