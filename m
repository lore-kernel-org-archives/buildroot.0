From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 22:12:18 +0200
Subject: [Buildroot] [PATCH 1/5] wireshark: remove documentation
In-Reply-To: <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 (Gilles Chanteperdrix's message of "Tue, 14 Jun 2016 17:11:15 +0200")
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <87shwfv8bh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org> writes:

 > Remove html and txt documentation from the rootfs as they unlikely to be
 > needed.

 > Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>

Committed, thanks.

usr/share/wireshark still contains >5MB of files, mainly xml and similar
text files. Do you know if these are all needed?

-- 
Bye, Peter Korsgaard
