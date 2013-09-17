From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 17 Sep 2013 16:29:29 -0400 (EDT)
Subject: [Buildroot] [PATCH] qt: install translations
In-Reply-To: <20130912214456.06ecd016@skate>
Message-ID: <2083353994.1282044.1379449769860.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> On Thu, 12 Sep 2013 15:12:36 -0400, Vivien Didelot wrote:
> > The Qt translation files are currently created and moved under
> > $(STAGING_DIR)/usr/translations but not installed on the target.
> > 
> > This patch defines the translations directory to
> > /usr/share/qt/translations and defines a
> > QT_INSTALL_TARGET_TRANSLATIONS
> > macro to deploy them from the staging directory to the target
> > directory.
> > 
> > Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> 
> This looks good, but I'm wondering: the translations that are
> installed
> in /usr/share/qt/translations are the translations of the Qt library
> itself, or the translations of the applications using Qt as their
> library?

These are the translations of Qt itself.

Thanks,
Vivien
