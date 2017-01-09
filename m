From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Jan 2017 17:19:01 +0100
Subject: [Buildroot] [PATCH 2/2] libnss: bump to version 3.27.2
In-Reply-To: <20170109140646.29648-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 9 Jan 2017 15:06:46 +0100")
References: <20170109140646.29648-1-peter@korsgaard.com>
 <20170109140646.29648-2-peter@korsgaard.com>
Message-ID: <87o9zgmcju.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes a memory leak in SSL_SetTrustAnchors():
 > https://bugzilla.mozilla.org/show_bug.cgi?id=1318561

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
