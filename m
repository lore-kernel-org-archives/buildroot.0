From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jun 2014 09:44:28 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.42.10
In-Reply-To: <20140604085237.2de9d1f5@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 4 Jun 2014 08:52:37 +0200")
References: <1401833214-31074-1-git-send-email-gustavo@zacarias.com.ar>
 <20140604085237.2de9d1f5@free-electrons.com>
Message-ID: <87y4xdp19f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Gustavo Zacarias,
 > On Tue,  3 Jun 2014 19:06:54 -0300, Gustavo Zacarias wrote:
 >> Drop --disable-tls since it's not needed.
 >> 
 >> Add --disable-rpath to avoid unnecessary pollution.
 >> 
 >> e4defrag now needs an (e)glibc toolchain because of sync_file_range()

 > Or musl, but I see that you implement the dependency as 'depends
 > on !uclibc', so it's fine. Thanks!

Yes, see my comment and Gustavo's v2.

-- 
Bye, Peter Korsgaard
