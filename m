From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Dec 2020 15:44:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: security bump to
 version 4.4.2
In-Reply-To: <20201210220853.375772-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 10 Dec 2020 23:08:53 +0100")
References: <20201210220853.375772-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8iwxx95.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-27207: Zetetic SQLCipher 4.x before 4.4.1 has a
 > use-after-free, related to sqlcipher_codec_pragma and sqlite3Strlen30 in
 > sqlite3.c. A remote denial of service attack can be performed. For
 > example, a SQL injection can be used to execute the crafted SQL command
 > sequence. After that, some unexpected RAM data is read.

 > https://www.zetetic.net/blog/2020/11/25/sqlcipher-442-release

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
