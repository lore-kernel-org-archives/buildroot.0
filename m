From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 15:59:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi-visualisation-goom: fix
 build with gcc-4.9
In-Reply-To: <20200127185413.1760-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 27 Jan 2020 19:54:13 +0100")
References: <20200127185413.1760-1-bernd.kuhls@t-online.de>
 <20200127185413.1760-2-bernd.kuhls@t-online.de>
Message-ID: <87ftfzr5iw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes build error:
 > output/build/kodi-visualisation-goom-2.1.0-Leia/lib/goom/src/lines.c:
 > In function 'goom_lines_draw':
 > output/build/kodi-visualisation-goom-2.1.0-Leia/lib/goom/src/lines.c:232:3:
 > error: 'for' loop initial declarations are only allowed in C99 or C11 mode
 >    for (int i = 1; i < AUDIO_SAMPLE_LEN; i++) {

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
