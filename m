From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Thu, 4 Aug 2011 11:33:44 +0200
Subject: [Buildroot] [Bug] alsamixer: can't load library 'libform.so.5'
In-Reply-To: <87ipqdpuhw.fsf@macbook.be.48ers.dk>
Message-ID: <20110804113344.77d1077c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, I did build ncurses and then added alsa-utils later!

I just now deleted output/build/ncurses and output/build/alsa-utils and
rerun a build. Works OK, no missing libraries.

Thanks!
