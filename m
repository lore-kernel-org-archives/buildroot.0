From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:49:25 +0100
Subject: [Buildroot] [PATCH 21/28] pango: fix X.org dependencies
In-Reply-To: <649024b2795de3d8ecd6d513362266ca6d879582.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:33 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <649024b2795de3d8ecd6d513362266ca6d879582.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87wqvi138a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> pango is a X client library, so it does not need to depend on the
 Thomas> X.org server. So, we replace the server dependency by dependencies on
 Thomas> the appropriate libraries.

Committed, thanks.

-- 
Bye, Peter Korsgaard
