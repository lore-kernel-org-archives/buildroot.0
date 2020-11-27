From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2020 17:48:26 +0100
Subject: [Buildroot] [PATCH/next v2,
 1/1] package/linux-pam: bump to version 1.5.1
In-Reply-To: <20201127171336.5466-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 27 Nov 2020 18:13:36 +0100")
References: <20201127171336.5466-1-fontaine.fabrice@gmail.com>
Message-ID: <87im9qsq3p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patches (already in version) and so autoreconf
 > - cracklib is not a dependency since
 >   https://github.com/linux-pam/linux-pam/commit/d702ff714c309069111899fd07c09e31c414c166

 > https://github.com/linux-pam/linux-pam/releases/tag/v1.5.0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Peter Korsgaard):
 >  - Bump from 1.4.0 to 1.5.1 beacuse patch bumping to 1.5.0 was not
 >    applied yet
 >  - Remove security statement about CVE-2020-27780 as the security issue
 >    has been added in version 1.5.0

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
