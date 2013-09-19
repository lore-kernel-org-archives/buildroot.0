From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Sep 2013 21:43:15 +0200
Subject: [Buildroot] [PATCH] qt: install translations
In-Reply-To: <1379013156-9918-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 (Vivien Didelot's message of "Thu, 12 Sep 2013 15:12:36 -0400")
References: <1379013156-9918-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <87li2segx8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vivien" == Vivien Didelot <vivien.didelot@savoirfairelinux.com> writes:

 Vivien> The Qt translation files are currently created and moved under
 Vivien> $(STAGING_DIR)/usr/translations but not installed on the target.

 Vivien> This patch defines the translations directory to
 Vivien> /usr/share/qt/translations and defines a
 Vivien> QT_INSTALL_TARGET_TRANSLATIONS macro to deploy them from the
 Vivien> staging directory to the target directory.

 Vivien> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
