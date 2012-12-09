From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Dec 2012 21:35:30 +0100
Subject: [Buildroot] [PATCH] libfuse: needs threads
In-Reply-To: <1355061941-10170-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 9 Dec 2012 11:05:41 -0300")
References: <1355061941-10170-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877gorx8tp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> libfuse needs threads, fixes:
 Gustavo> http://autobuild.buildroot.net/results/0111a67b9ed5f5f5dfc0725d009ea5c756c1755c

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/libfuse/Config.in |    5 +++--
 Gustavo>  package/sshfs/Config.in   |    1 +
 Gustavo>  package/unionfs/Config.in |    1 +

You forgot to update the sshfs/unionfs comments to match, but I fixed
that and committed, thanks.

-- 
Bye, Peter Korsgaard
