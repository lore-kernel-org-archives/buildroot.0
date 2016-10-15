From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:34:11 +0200
Subject: [Buildroot] [PATCH 4/8] poppler: add explicit libglib2 support
In-Reply-To: <1476321239-13894-4-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 12 Oct 2016 22:13:55 -0300")
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
 <1476321239-13894-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wphaot0s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Evince needs poppler-glib support (when poppler is enabled, for PDF
 > reading support), so add explicit handling to the package.
 > And poppler-glib requires cairo output, hence the conditional on both
 > libglib2 and cairo to enable it.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
