From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Sep 2016 17:00:34 +0200
Subject: [Buildroot] [PATCH] mpg123: security bump to version 1.23.8
In-Reply-To: <1474971020-10240-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 27 Sep 2016 07:10:20 -0300")
References: <1474971020-10240-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8760ph2xrh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes an out-of-bounds memory read in the ID3v2 parser for tags that
 > claim an unrealistically small length. This crashes mpg123 or any
 > application using libmpg123 with activated ID3v2 parsing.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
