From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 12:31:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/oniguruma: security bump to
 version 6.9.3
In-Reply-To: <20190806175116.20356-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 6 Aug 2019 19:51:16 +0200")
References: <20190806175116.20356-1-fontaine.fabrice@gmail.com>
Message-ID: <87o9030z1o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes CVE-2019-13224: A use-after-free in onig_new_deluxe() in regext.c
 > in Oniguruma 6.9.2 allows attackers to potentially cause information
 > disclosure, denial of service, or possibly code execution by providing a
 > crafted regular expression. The attacker provides a pair of a regex
 > pattern and a string, with a multi-byte encoding that gets handled by
 > onig_new_deluxe().

 > Fixes CVE-2019-13225: A NULL Pointer Dereference in match_at() in
 > regexec.c in Oniguruma 6.9.2 allows attackers to potentially cause
 > denial of service by providing a crafted regular expression.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
