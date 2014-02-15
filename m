From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Feb 2014 08:21:36 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: fix sed line in "sanitize path
	in units" hook
In-Reply-To: <1392432177-13204-1-git-send-email-vsergeev@kumunetworks.com>
 (Ivan Sergeev's message of "Fri, 14 Feb 2014 18:42:57 -0800")
References: <1392432177-13204-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <87sirkkfi7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ivan" == Ivan Sergeev <vsergeev@kumunetworks.com> writes:

 > The expanded SED variable already contains -e, so the extra -e was being
 > interpreted as the sed command and causing sed to fail.

 > Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
