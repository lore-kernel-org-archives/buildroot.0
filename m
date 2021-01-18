From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2021 21:19:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 4.6.0
In-Reply-To: <20210114194832.1975973-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 14 Jan 2021 20:48:32 +0100")
References: <20210114194832.1975973-1-fontaine.fabrice@gmail.com>
Message-ID: <874kjef15u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-36177: RsaPad_PSS in wolfcrypt/src/rsa.c in wolfSSL
 >   before 4.6.0 has an out-of-bounds write for certain relationships
 >   between key size and digest size.
 > - Drop patch (already in version)

 > https://github.com/wolfSSL/wolfssl/releases/tag/v4.6.0-stable

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
