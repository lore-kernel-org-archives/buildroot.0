From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 19:38:36 +0100
Subject: [Buildroot] [PATCH v2] package/faad2: add hash
In-Reply-To: <1418581317-8323-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 14 Dec 2014 19:21:57 +0100")
References: <1418581317-8323-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ppbmnkk3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Upstream do not host the files, they are hosted on SourceForge; SF has
 > both sha1 and md5, so use the sha1.

 > Also add a strong, locally computed hash.

 > Should fix build failures for which sourceforge sends garbage:
 >     http://autobuild.buildroot.org/results/f0a/f0a36c78fd910bc0aea54df4b76ab8a0f82f7ae4/
 >     http://autobuild.buildroot.org/results/3d6/3d6134c71e57238d4d865040eac9f34e2d17844c/
 >     http://autobuild.buildroot.org/results/232/2323f72f9b08ef8e20ec67a5aebfadd5b469a298/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

 > ---
 > Changes v1 -> v2:
 >   - add sha1 from upstream  (Bernd)

Committed, thanks.

-- 
Bye, Peter Korsgaard
