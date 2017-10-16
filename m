From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:48:57 +0200
Subject: [Buildroot] [PATCH] file: security bump to version 5.32
In-Reply-To: <20170906140037.3852-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 6 Sep 2017 16:00:37 +0200")
References: <20170906140037.3852-1-peter@korsgaard.com>
Message-ID: <87o9p6vk52.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-1000249 - Stack buffer overflow with a specially crafted
 > .notes section in an ELF binary file.

 > For more details, see: http://www.openwall.com/lists/oss-security/2017/09/05/3

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
