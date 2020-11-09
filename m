From: Alexander Dahl <post@lespocky.de>
Date: Mon, 9 Nov 2020 14:54:03 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-11-08
Message-ID: <20201109135402.ddk3myxwpwf7mkey@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

that vulnerability was fixed by Fabrice Fontaine
with 148058a46293 ("package/fastd: bump to version 21") for master and
with 7e4af3ce3f91 ("package/fastd: fix CVE-2020-27638") which got
cherry-picked for the stable branches.

In the stable branches, there's a marker in FASTD_IGNORE_CVES in
package/fastd/fastd.mk which probably silences such warnings. But how
is this supposed to work if such vulnerabilities are closed via an
ordinary release like that v21 in case of fastd? Just adding all CVE
numbers to that variable could pile up a lot over time?

Greets
Alex

On Mon, Nov 09, 2020 at 08:10:46AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Packages with CVEs
> ==================
> 
> This is the list of packages for which a known CVE is affecting
> them, which means a security vulnerability exists for
> those packages.
> 
>              name              |       CVE        |                             link                            
> -------------------------------+------------------+--------------------------------------------------------------
>                          fastd | CVE-2020-27638   | https://security-tracker.debian.org/tracker/CVE-2020-27638  
> 
> -- 
> http://autobuild.buildroot.net

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201109/ef980b82/attachment.asc>
