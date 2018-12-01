From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 Dec 2018 09:50:57 +0100
Subject: [Buildroot] libopenssl
In-Reply-To: <003801d48951$0d1e41b0$275ac510$@gmail.com> (Ahmed Hamdallah's
 message of "Sat, 1 Dec 2018 12:37:08 +0400")
References: <003801d48951$0d1e41b0$275ac510$@gmail.com>
Message-ID: <878t196366.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ahmed" == Ahmed Hamdallah <ahmdprog@gmail.com> writes:

 > Dear Team,
 > Thank you for updating openssl lib to version 1.0.2q. I am wondering why you
 > don't include the latest version 1.1.x because 1.0.x is really very old one.

There is already a patch series pending for bumping to the 1.1.x series
and fixing various package breakages:

https://patchwork.ozlabs.org/project/buildroot/list/?series=43267

 > Any help please to include the latest openssl 1.1.x in buildroot ?.

Help reviewing and testing that series and fixing any other breakage
caused by it is more than welcome!

-- 
Bye, Peter Korsgaard
