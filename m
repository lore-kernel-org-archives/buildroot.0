From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 20 May 2021 02:21:16 +0200
Subject: [Buildroot] Spidermonkey bump version
Message-ID: <a59a82c3-0000-73ca-6c6d-7ac2aef7ff2e@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

since I'm working on udisks bump version I've noticed its dependency 
spidermonkey that is pretty old. I've seen that download site points to 
a gentoo archive to save 200M of download without downloading entire 
Firefox. Would it make sense to change site back to [1] and bump it once 
89.0 is released?

The only packages that use it is polkit that in order is used by:
- udisks
and optionally by:
- gvfs
- brltty
- systemd

[1]: https://archive.mozilla.org/pub/firefox/releases/89.0b14/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
