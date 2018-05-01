From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 08:52:18 +0200
Subject: [Buildroot] [PATCH 1/1] qt53d: Install missing QML modules,
 plugins and examples
In-Reply-To: <1523838643-10141-1-git-send-email-rom.reignier@gmail.com>
 (Romain Reignier's message of "Mon, 16 Apr 2018 02:30:43 +0200")
References: <1523838643-10141-1-git-send-email-rom.reignier@gmail.com>
Message-ID: <87in87ookd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Reignier <rom.reignier@gmail.com> writes:

 > Some files were missing on the first build of qt53d but added later:
 > - by qt5base for the plugins because it copies the whole /usr/lib/qt/plugins
 >   directory
 > - by qt5declarative for the QML modules because it copies the whole
 >   /usr/qml directory

 > The qt53d examples were not installed if BR2_PACKAGE_QT5BASE_EXAMPLES was
 > set

 > Signed-off-by: Romain Reignier <rom.reignier@gmail.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
