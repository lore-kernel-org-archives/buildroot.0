From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jun 2014 08:53:54 +0200
Subject: [Buildroot] [PATCHv2] e2fsprogs: bump to version 1.42.10
In-Reply-To: <1401837356-3563-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 Jun 2014 20:15:56 -0300")
References: <1401837356-3563-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738flqi65.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Drop --disable-tls since it's not needed.
 > Add --disable-rpath to avoid unnecessary pollution.

 > e4defrag now needs an (e)glibc or musl toolchain because of
 > sync_file_range()
 > See e2fsprogs commit 58229aaf85d435469e901c974f31ead6d9124166

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
