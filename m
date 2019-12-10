From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Dec 2019 10:32:11 +0100
Subject: [Buildroot] [PATCH 2/2] SDL_mixer: Add support for libmodplug
In-Reply-To: <20191209191554.821230-2-paul@crapouillou.net> (Paul Cercueil's
 message of "Mon, 9 Dec 2019 20:15:54 +0100")
References: <20191209191554.821230-1-paul@crapouillou.net>
 <20191209191554.821230-2-paul@crapouillou.net>
Message-ID: <877e34h6g4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > Add support for playing back tracker modules using libmodplug.
 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 > ---
 >  .../0003-Fix-include-of-modplug.h.patch       | 33 +++++++++++++++++++
 >  package/sdl_mixer/sdl_mixer.mk                |  7 ++++
 >  2 files changed, 40 insertions(+)
 >  create mode 100644 package/sdl_mixer/0003-Fix-include-of-modplug.h.patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
