From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jul 2010 22:53:30 +0200
Subject: [Buildroot] [PATCH] qt: fix alsa-lib dependency
In-Reply-To: <4C4DE61A.7070101@lucaceresoli.net> (Luca Ceresoli's message of
	"Mon, 26 Jul 2010 21:46:34 +0200")
References: <1279747259-10054-1-git-send-email-luca@lucaceresoli.net>
	<4C4DE61A.7070101@lucaceresoli.net>
Message-ID: <876302dkxh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <list@lucaceresoli.net> writes:

 Luca> luca at lucaceresoli.net wrote:
 >> From: Luca Ceresoli <luca@lucaceresoli.net>
 >> 
 >> If BR2_PACKAGE_QT_AUDIO_BACKEND=y, QtMultimedia requires the audio backend
 >> to be already in staging in order to compile.
 >> The backend is system-dependent, but since buildroot builds Linux systems
 >> only, it is safe to assume that the it will be always ALSA.
 >> 

 Luca> Peter, are you considering this for 2010.08?

Yes, committed - Thanks.

-- 
Bye, Peter Korsgaard
