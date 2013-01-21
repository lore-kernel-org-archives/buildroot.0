From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 23:46:27 +0100
Subject: [Buildroot] [PATCH 03/10] audiofile: add license information
In-Reply-To: <1358803790-30245-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 21 Jan 2013 18:29:43 -0300")
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
 <1358803790-30245-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878v7m888s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/audiofile/audiofile.mk | 2 ++
 Gustavo>  1 file changed, 2 insertions(+)

 Gustavo> diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
 Gustavo> index 1c6e6de..504a81a 100644
 Gustavo> --- a/package/audiofile/audiofile.mk
 Gustavo> +++ b/package/audiofile/audiofile.mk
 Gustavo> @@ -8,6 +8,8 @@ AUDIOFILE_VERSION = 0.3.4
 Gustavo>  AUDIOFILE_SITE = http://audiofile.68k.org
 Gustavo>  AUDIOFILE_INSTALL_STAGING = YES
 Gustavo>  AUDIOFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 Gustavo> +AUDIOFILE_LICENSE = GPLv2 LGPLv2
 Gustavo> +AUDIOFILE_LICENSE_FILES = COPYING COPYING.GPL

It's (L)GPLv2+:

grep -rls 'later version' *|wc -l
118

Committed with that change, thanks.


-- 
Bye, Peter Korsgaard
