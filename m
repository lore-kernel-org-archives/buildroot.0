From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Apr 2021 09:32:40 +0200
Subject: [Buildroot] [PATCH] package/avahi: ignore CVE-2021-26720
In-Reply-To: <20210407135423.28899-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 7 Apr 2021 15:54:23 +0200")
References: <20210407135423.28899-1-peter@korsgaard.com>
Message-ID: <87eeflb59j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > CVE-2021-26720 is an issue in avahi-daemon-check-dns.sh, which is part of
 > the Debian packaging and not part of upstream avahi - So ignore the CVE.

 > https://security-tracker.debian.org/tracker/CVE-2021-26720

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
