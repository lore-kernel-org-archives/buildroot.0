From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Mar 2021 08:19:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: security bump to
 version 4.4.3
In-Reply-To: <20210329204903.320444-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Mar 2021 22:49:03 +0200")
References: <20210329204903.320444-1-fontaine.fabrice@gmail.com>
Message-ID: <87sg4dcgek.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-3119: Zetetic SQLCipher 4.x before 4.4.3 has a NULL pointer
 > dereferencing issue related to sqlcipher_export in crypto.c and
 > sqlite3StrICmp in sqlite3.c. This may allow an attacker to perform a
 > remote denial of service attack. For example, an SQL injection can be
 > used to execute the crafted SQL command sequence, which causes a
 > segmentation fault.

 > https://github.com/sqlcipher/sqlcipher/blob/v4.4.3/CHANGELOG.md

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
