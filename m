From: Alexander Dahl <post@lespocky.de>
Date: Mon, 5 Apr 2021 14:36:01 +0200
Subject: [Buildroot] fastd CPE/CVE reporting (Was: [autobuild.buildroot.net]
 Your daily results for 2021-03-21)
In-Reply-To: <20210329152803.594a910f@windsurf.home>
References: <20210322114835.6hmpplzygzejxiab@falbala.internal.home.lespocky.de>
 <20210329132357.zxqt5szg72dchddu@falbala.internal.home.lespocky.de>
 <20210329152803.594a910f@windsurf.home>
Message-ID: <20210405123600.mutgqbczb7jqehjj@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, Mar 29, 2021 at 03:28:03PM +0200, Thomas Petazzoni wrote:
> For this particular fastd CVE issue, what needs to be added is (1) the
> proper CPE identifier information in the Buildroot package and (2) get
> the NVD database maintainers to fix the CVE entry to indicate which
> fastd version has fixed the security vulnerability.

I hoped to have added the proper CPE identifier with ebe599de08ec
("package/fastd: add FASTD_CPE_ID_VERSION") in master (which was also
backported to 2021.02.x). However I got another warning mail today.

I'm not sure I understand (2) correctly. As far as I can see at
https://nvd.nist.gov/vuln/detail/CVE-2020-27638 that CVE is marked as
fixed for fastd 21.0.

Is there anything I missed to set for the buildroot package?

Greets
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210405/c8f8e939/attachment.asc>
