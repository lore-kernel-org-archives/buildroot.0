From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:10:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.1.1
In-Reply-To: <20200521143957.73835-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 21 May 2020 16:39:57 +0200")
References: <20200521143957.73835-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1uzkdyj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > From ChangeLog:
 > - CVE: GHSL-2020-100 OOB Read in ntlm_read_ChallengeMessage
 > - CVE: GHSL-2020-101 OOB Read in security_fips_decrypt due to
 >   uninitialized value
 > - CVE: GHSL-2020-102 OOB Write in crypto_rsa_common
 > - Enforce synchronous legacy RDP encryption count (#6156)
 > - Fixed some leaks and crashes missed in 2.1.0
 > - Removed dynamic channel listener limits
 > - Lots of resource cleanup fixes (clang sanitizers)

 > https://github.com/FreeRDP/FreeRDP/blob/2.1.1/ChangeLog

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
