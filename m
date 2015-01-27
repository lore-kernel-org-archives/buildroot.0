From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 16:25:33 +0100
Subject: [Buildroot] [PATCH 3/5] package/imlib2: Switch to giflib
In-Reply-To: <1422300260-5361-3-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Mon, 26 Jan 2015 20:24:18 +0100")
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <8761bsz1n6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/imlib2/0001-giflib51.patch |   71 ++++++++++++++++++++++++++++++++++++
 >  package/imlib2/Config.in           |    2 +-
 >  package/imlib2/imlib2.mk           |    2 +-
 >  3 files changed, 73 insertions(+), 2 deletions(-)
 >  create mode 100644 package/imlib2/0001-giflib51.patch

How about instead bumping our imlib2 version? I see there is some giflib
support in upstream git:

https://git.enlightenment.org/legacy/imlib2.git/log/

-- 
Bye, Peter Korsgaard
