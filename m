From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 20:20:38 +0200
Subject: [Buildroot] [PATCH 1/1] grub2: if BR2_STRIP_none is 'y' then
	grub2 will not build
In-Reply-To: <1463861470-16123-1-git-send-email-ckhardin@exablox.com> (Charles
 Hardin's message of "Sat, 21 May 2016 13:11:09 -0700")
References: <1463861470-16123-1-git-send-email-ckhardin@exablox.com>
Message-ID: <874m75sm89.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Hardin <ckhardin@exablox.com> writes:

 > grub2 assumes the strip command will generate output and the
 > output should always be stripped - so, just use the $(TARGET_CROSS)strip
 > to make sure that the build succeeds regards of the buildroot
 > strip configuration.

 > Signed-off-by: Charles Hardin <ckhardin@exablox.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
