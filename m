From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 20:46:39 +0100
Subject: [Buildroot] [PATCH] package/tcpdump: remove duplicated binary
In-Reply-To: <20210216125031.2244-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 16 Feb 2021 13:50:30 +0100")
References: <20210216125031.2244-1-patrickdepinguin@gmail.com>
Message-ID: <87czwz94o0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Since tcpdump 4.99.0, the 'tcpdump' binary is no longer installed in
 > /usr/sbin but in /usr/bin. This change invalidates the Buildroot hook
 > 'TCPDUMP_REMOVE_DUPLICATED_BINARY', causing a fairly large rootfs size
 > increase as a result.

 > Update the path inside this hook.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
