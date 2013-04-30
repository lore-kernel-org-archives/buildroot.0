From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 30 Apr 2013 22:33:52 +0200
Subject: [Buildroot] [PATCH v2 3/3] rootfs-overlay: use a make foreach
	instead of a shell for
In-Reply-To: <517FF854.9090903@mind.be> (Arnout Vandecappelle's message of
 "Tue, 30 Apr 2013 18:59:00 +0200")
References: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
 <1365439816-6935-4-git-send-email-luca@lucaceresoli.net>
 <517FF854.9090903@mind.be>
Message-ID: <87ppxb21xr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 08/04/13 18:50, Luca Ceresoli wrote:
 >> Makes the code uniform with the post-build and post-image implementation
 >> (which is slightly simpler and, presumably, more efficient).
 >> 
 >> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

 Arnout> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
