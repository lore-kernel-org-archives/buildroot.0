From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 May 2015 17:13:17 +0200
Subject: [Buildroot] [PATCHv2] package/neard: needs shared libs
In-Reply-To: <1430777547-30022-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 5 May 2015 00:12:27 +0200")
References: <1430777547-30022-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ioc7oy5u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > neard uses dlopen(), so needs shared libs.
 > Fixes:
 >     http://autobuild.buildroot.org/results/0a4/0a466cde55c5e128a2e201924f80f0ec6b8b5c2a/

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Changes v1 -> v2:
 >   - update comment

 > ---
 > Note: the only package that selects neard is connman, and it already
 > depends on !static.

Committed, thanks.

-- 
Bye, Peter Korsgaard
