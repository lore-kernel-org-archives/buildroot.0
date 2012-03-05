From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Mar 2012 20:57:15 +0100
Subject: [Buildroot] [PATCH 1/1] package: fix WGET download method
In-Reply-To: <fe086fb24478f0a1b106549e084da96cf7b26da1.1330941923.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 5 Mar 2012 11:06:23 +0100")
References: <cover.1330941923.git.thomas.petazzoni@free-electrons.com>
 <cover.1330941923.git.thomas.petazzoni@free-electrons.com>
 <fe086fb24478f0a1b106549e084da96cf7b26da1.1330941923.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87booaizxg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In cf2486bf317e4bbf88c801fb96183ba62be78cc8, we changed from using the
 Thomas> -P option of wget (to set the output *directory*) to using the -O
 Thomas> option (to set the output *file*). Unfortunately, wget -O has a
 Thomas> strange behaviour: it creates an empty 0-byte file even if the
 Thomas> download fails (for example when there is no network connection).

Committed, thanks.

-- 
Bye, Peter Korsgaard
