From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Oct 2014 09:32:34 +0200
Subject: [Buildroot] [PATCH] libshout: fix typo
In-Reply-To: <1413557524-28370-1-git-send-email-jezz@sysmic.org>
References: <1413557524-28370-1-git-send-email-jezz@sysmic.org>
Message-ID: <CACXmVibB5WhXpZjmALC2hTM=CfMdXbt2oTt-icNY5MTpWJsEgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 17, 2014 at 4:52 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Fix error:
>   package/libshout/libshout.mk:28: *** Package error: use LIBSHOUT_CONF_OPTS instead of LIBSHOUT_CONF_OPT. Please fix your .mk file.  Stop.

Argh, sorry about that - Committed, thanks!

-- 
Bye, Peter Korsgaard
