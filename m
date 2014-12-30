From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Dec 2014 11:19:44 +0100
Subject: [Buildroot] [PATCH 2/2] package/libiio: fix static build
In-Reply-To: <1419932187-2319-2-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Tue, 30 Dec 2014 10:36:27 +0100")
References: <1419932187-2319-1-git-send-email-s.martin49@gmail.com>
 <1419932187-2319-2-git-send-email-s.martin49@gmail.com>
Message-ID: <87y4ppbfsv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Use the CMake module provided by libxml2 instead of the one from CMake to
 > correctly set the cflags and ldflags.

 > Fixes:
 >   http://autobuild.buildroot.net/results/964f98fafdcd7e994ea25cf0993915d81537c31c/

 > Note that this patch needs the following one to be merged in libxml2:
 >   https://mail.gnome.org/archives/xml/2014-December/msg00015.html

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
