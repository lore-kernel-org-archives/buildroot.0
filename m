From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Mar 2021 22:34:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/tpm2-pkcs11: needs threads
In-Reply-To: <20210227192639.6703-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 27 Feb 2021 20:26:39 +0100")
References: <20210227192639.6703-1-fontaine.fabrice@gmail.com>
Message-ID: <87tupumucy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > tpm2-pkcs11 fails to build without threads since its addition with
 > commit 42db2c7236c2249ec02608ed714fa6f95e36161b

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8218776da34cc4a20663ae6737ad7727b12d8cd2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
