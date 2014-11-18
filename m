From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 08:42:11 +0100
Subject: [Buildroot] [PATCHv3] package/sdl_sound: fix constness in debug
	mode
In-Reply-To: <1416257165-19798-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 17 Nov 2014 21:46:05 +0100")
References: <1416257165-19798-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87egt1arak.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When in debug mode, ./configure forces -Werror, which uncovers a
 > constness issue in the speex decoder.

 > Add a patch to fix this.

 > Fixes:
 >     http://autobuild.buildroot.net/results/6f5/6f5e1b782923d6e69e929466f0ddd3eeba28c6f1/
 >     http://autobuild.buildroot.net/results/c1b/c1b31dc37fe62cb6901edad02bf50d73072b7cf0/
 >     http://autobuild.buildroot.net/results/162/162e6d77e5812060001ea22faff99055aae3122a/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

 > ---
 > Changes v2 -> v3:
 >   - do not autoreconf  (Bernd)

 > Changes v1 -> v2:
 >   - fix the code rather than hiding the bug  (Peter, Bernd, Vicente)

Committed, thanks.

-- 
Bye, Peter Korsgaard
