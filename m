From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2020 20:41:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/subversion: drop first patch
In-Reply-To: <20200910055023.111472-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 10 Sep 2020 07:50:23 +0200")
References: <20200910055023.111472-1-fontaine.fabrice@gmail.com>
Message-ID: <878sdh5v9x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > First patch is not needed since version 1.8.0 and
 > https://github.com/apache/subversion/commit/f071ec0c26cdf47e89fa90b31d2233ee1a2b00c2

 > Indeed, as spotted by upstream when sending them this patch, the
 > original expressions will not mangle '-mfloat-gprs=double' because the
 > patterns contain a trailing space.

Ahh, indeed not any more - Good catch!

Committed, thanks.

-- 
Bye, Peter Korsgaard
