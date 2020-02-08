From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2020 20:19:13 +0100
Subject: [Buildroot] [PATCH v2 1/2] Revert "system: don't attempt
 swapon/swapoff in inittab if not available"
In-Reply-To: <20200207223322.7182-2-unixmania@gmail.com> (unixmania's message
 of "Fri, 7 Feb 2020 19:33:21 -0300")
References: <20200207223322.7182-1-unixmania@gmail.com>
 <20200207223322.7182-2-unixmania@gmail.com>
Message-ID: <87sgjkubta.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > This reverts commit c4dce0ae0f5d5d7fecb6f493e974e131a6df43da.

 > A different fix will be provided in a forthcoming patch.
 > ---
 > CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > CC: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
