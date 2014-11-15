From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Nov 2014 14:28:49 +0100
Subject: [Buildroot] [PATCH] host-qemu: fix install
In-Reply-To: <1416049080-6544-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sat, 15 Nov 2014 11:58:00 +0100")
References: <1416049080-6544-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87zjbsegoe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > at configure time, PREFIX is already set with $(HOST_DIR)/usr
 > so, don't use DESTDIR

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
