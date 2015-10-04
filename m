From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 12:25:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptables: fix build on musl
In-Reply-To: <1441049342-12623-1-git-send-email-brendanheading@gmail.com>
 (Brendan Heading's message of "Mon, 31 Aug 2015 20:29:02 +0100")
References: <1441049342-12623-1-git-send-email-brendanheading@gmail.com>
Message-ID: <87twq7ue01.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brendan" == Brendan Heading <brendanheading@gmail.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/68b/68bf8830f87ab32f4fd650c9dd4a8c80592983a9/
 > http://autobuild.buildroot.net/results/d9b/d9bb677fb5510adf05ffb4afbc63ead83d7e18dd/
 > http://autobuild.buildroot.net/results/4b8/4b80b6d0131b624301a5cfcd5541897f411043c9/

 > .. and others.

 > This patch includes two backported patches from iptables git, plus one
 > pending patch not integrated yet.

 > Signed-off-by: Brendan Heading <brendanheading@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
