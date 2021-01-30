From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 13:46:34 +0100
Subject: [Buildroot] [PATCH 2/2] package/socat: security bump to version
 1.7.4.1
In-Reply-To: <20210127214456.3402995-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 27 Jan 2021 22:44:56 +0100")
References: <20210127214456.3402995-1-fontaine.fabrice@gmail.com>
 <20210127214456.3402995-2-fontaine.fabrice@gmail.com>
Message-ID: <8735yitwwl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Buffer size option (-b) is internally doubled for CR-CRLF conversion,
 > but not	checked for integer overflow. This could lead to heap based
 > buffer overflow, assuming the attacker could provide this parameter.

 > - Update indentation in hash file (two spaces)
 > - Update hash of README file due to minor updates:
 >   https://repo.or.cz/socat.git/commit/b145170837d75bd7a1a5803283910ab075d47bea
 >   https://repo.or.cz/socat.git/commit/0a115feadc3102f17e0a8a1a985319af0295f704

 > http://www.dest-unreach.org/socat/doc/CHANGES

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
