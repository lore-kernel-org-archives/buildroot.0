From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 22:31:49 +0200
Subject: [Buildroot] [PATCH 1/5] wireshark: remove documentation
In-Reply-To: <87fusfv7pn.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 14 Jun 2016 22:25:24 +0200")
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160614193321.GA3759@free.fr> <87fusfv7pn.fsf@dell.be.48ers.dk>
Message-ID: <87bn33v7ey.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > With that said, I've changed it to use xargs:

 > find $(TARGET_DIR)/usr/share/wireshark -name '*.txt' -o '*.html' -print0 \
 >         | xargs -0 rm -f

Ups, I missed a -print0 after -name '*.txt'.

-- 
Bye, Peter Korsgaard
