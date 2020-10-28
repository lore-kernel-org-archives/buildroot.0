From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2020 16:18:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/oniguruma: fix CVE-2020-26159
In-Reply-To: <20201015170253.968250-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 15 Oct 2020 19:02:53 +0200")
References: <20201015170253.968250-1-fontaine.fabrice@gmail.com>
Message-ID: <871rhijs4v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-26159: In Oniguruma 6.9.5_rev1, an attacker able to supply
 > a regular expression for compilation may be able to overflow a buffer by
 > one byte in concat_opt_exact_str in src/regcomp.c.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
