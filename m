From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Sep 2017 09:45:05 +0200
Subject: [Buildroot] [PATCH] libsoup: security bump to version 2.56.1
In-Reply-To: <20170907150754.8147-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 7 Sep 2017 17:07:54 +0200")
References: <20170907150754.8147-1-peter@korsgaard.com>
Message-ID: <87vakg30xq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-2885: stack based buffer overflow with HTTP Chunked Encoding
 > For more details, see
 > https://bugzilla.gnome.org/show_bug.cgi?id=785774

 > While we're at it, add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
