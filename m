From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 14:29:58 +0100
Subject: [Buildroot] [PATCH 2/2] libpjsip: disable all bundled third
	party libraries
In-Reply-To: <1458219072-4113-2-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Thu, 17 Mar 2016 13:51:12 +0100")
References: <1458219072-4113-1-git-send-email-luca@lucaceresoli.net>
 <1458219072-4113-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <87egb95j1l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > libpjsip bundles several third party libraries. In Buildroot we prefer
 > either not to build them or to depend on a proper package for each of
 > them. The current recipe disables most of them, but not all, so
 > disable the remaining ones.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
