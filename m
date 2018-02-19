From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 23:46:42 +0100
Subject: [Buildroot] [PATCH v2 1/1] qt5webengine: fix build issue with
 alsa
In-Reply-To: <20180214023714.21143-1-gael.portay@savoirfairelinux.com>
 (=?utf-8?Q?=22Ga=C3=ABl?=
 PORTAY"'s message of "Tue, 13 Feb 2018 21:37:14 -0500")
References: <20180214023714.21143-1-gael.portay@savoirfairelinux.com>
Message-ID: <87eflgha25.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ga?l" == Ga?l PORTAY <gael.portay@savoirfairelinux.com> writes:

 > Qt WebEngine auto-guesses if it compiles support for alsa. When the
 > alsa-lib config is enabled but the features mixer, rawmidi, hwdep and
 > seq are not also enabled, it leads to a build failure.

 > Lets the developer decide whether or not support for alsa in Qt
 > WebEngine by adding the new config BR2_PACKAGE_QT5WEBENGINE_ALSA that
 > selects the features it needs when it is set.

 > Fixes [1].

 > [1]: http://autobuild.buildroot.net/results/d81537a8f67bb0a3625057560b2f16daf4828f98/build-end.log

 > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
 > ---

 > Changes since v1:
 > 	* turn alsa-lib dependency into select

Committed, thanks.

-- 
Bye, Peter Korsgaard
