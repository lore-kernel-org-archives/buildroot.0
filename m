From: Alexander Dahl <post@lespocky.de>
Date: Mon, 22 Mar 2021 12:48:36 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-03-21
Message-ID: <20210322114835.6hmpplzygzejxiab@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm a little unhappy to annoy anyone with this request, however
reports like the one below pop up over and over again in my INBOX like
round about once a week.  That particular CVE issue in fastd was fixed
upstream in October 2020 and was fixed for buildroot by Fabrice
Fontaine few days later already.  See below.

On Mon, Mar 22, 2021 at 10:26:07AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Packages having CVEs
> ====================
> 
> This is the list of packages for which a known CVE is affecting them,
> which means a security vulnerability exists for those packages.
> 
> CVEs for the 'master' branch
> ----------------------------
> 
>              name              |       CVE        |                             link                            
> -------------------------------+------------------+--------------------------------------------------------------
>                          fastd | CVE-2020-27638   | https://security-tracker.debian.org/tracker/CVE-2020-27638  
> 

Fixed in master with 7e4af3ce3f91 ("package/fastd: fix
CVE-2020-27638"). And it remains fixed after 148058a46293
("package/fastd: bump to version 21").

> 
> CVEs for the '2020.11.x' branch
> -------------------------------
> 
>              name              |       CVE        |                             link                            
> -------------------------------+------------------+--------------------------------------------------------------
>                          fastd | CVE-2020-27638   | https://security-tracker.debian.org/tracker/CVE-2020-27638  
> 

Same commits as above are in this branch, too.

> 
> CVEs for the '2021.02.x' branch
> -------------------------------
> 
>              name              |       CVE        |                             link                            
> -------------------------------+------------------+--------------------------------------------------------------
>                          fastd | CVE-2020-27638   | https://security-tracker.debian.org/tracker/CVE-2020-27638  
> 

Same commits as above are in this branch, too.

Could please someone with access to that bot fix it to not report
already addressed CVEs anymore?

Thanks and greets
Alex

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210322/e90f2ebf/attachment.asc>
