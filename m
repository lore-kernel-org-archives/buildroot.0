From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Oct 2016 14:17:21 +0200
Subject: [Buildroot] [PATCH 2/2] efibootmgr: bump to version 14
In-Reply-To: <1475246804-26748-2-git-send-email-nunes.erico@gmail.com> (Erico
 Nunes's message of "Fri, 30 Sep 2016 16:46:44 +0200")
References: <1475246804-26748-1-git-send-email-nunes.erico@gmail.com>
 <1475246804-26748-2-git-send-email-nunes.erico@gmail.com>
Message-ID: <878tu7q71q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Erico" == Erico Nunes <nunes.erico@gmail.com> writes:

 > Upstream has changed version numbering scheme since version 13, which
 > came after version 0.12.

 > There is now a make install target, so we can drop the manual file
 > installing. The make install target also installs the new efibootdump
 > tool.

I see it now installs into usr/sbin, and also installs efibootdump, but
that is probably ok:

install -m 755 efibootmgr /home/peko/source/buildroot/output/target//usr/sbin/efibootmgr
install -m 755 efibootdump /home/peko/source/buildroot/output/target//usr/sbin/efibootdump

Committed, thanks.

-- 
Bye, Peter Korsgaard
