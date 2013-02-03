From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 03 Feb 2013 15:21:35 +0100
Subject: [Buildroot] [PATCH v3 4/5] lvm2: Install devmapper.pc to
	staging/target pkgconfig directory.
In-Reply-To: <1358546927-25707-5-git-send-email-marek.belisko@open-nandra.com>
 (Marek Belisko's message of "Fri, 18 Jan 2013 23:08:46 +0100")
References: <1358546927-25707-1-git-send-email-marek.belisko@open-nandra.com>
 <1358546927-25707-5-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <874nht5vgw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marek" == Marek Belisko <marek.belisko@open-nandra.com> writes:

 Marek> Without this change if some package which have dependency on
 Marek> device mapper and use pkgconfig to check version always fail to
 Marek> find library because devmapper.pc file wasn't installed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
