From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 22:06:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: security bump to
 version 4.3.0
In-Reply-To: <20200213184148.2090807-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 13 Feb 2020 19:41:48 +0100")
References: <20200213184148.2090807-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfp6dwnk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > From https://www.zetetic.net/blog/2019/08/14/defcon-sqlite-attacks:
 > "We strongly recommend that all applications upgrade to SQLCipher 4.2.0
 > to take advantage of the latest security updates, especially if an
 > application interacts with non-encrypted databases using SQLCipher."

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

What should we do for 2019.02.x (which uses 3.2.0)?

-- 
Bye, Peter Korsgaard
