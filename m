From: Alexander Dahl <post@lespocky.de>
Date: Fri, 11 Mar 2016 08:54:21 +0100
Subject: [Buildroot] [PATCH 1/1] putty: add new package
In-Reply-To: <20160311070500.GF2057@tarshish>
References: <1457678759-11688-1-git-send-email-post@lespocky.de>
 <20160311070500.GF2057@tarshish>
Message-ID: <56E279AD.1050601@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On 11.03.2016 08:05, Baruch Siach wrote:
> On Fri, Mar 11, 2016 at 07:45:59AM +0100, Alexander Dahl wrote:
>> +	help
>> +	  PuTTY is a free SSH and Telnet client
>> +
>> +	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
> 
> It might be useful to note here that the putty program itself depends on gtk2. 
> Without gtk2, only command line utilities (pscp, plink, etc.) are built.

You mean in the help text there? I know this is the case, but it might
be a good idea to make it a little more explicit, yes.

Greets
Alex

-- 
?With the first link, the chain is forged. The first speech censured,
the first thought forbidden, the first freedom denied, chains us all
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: 02C8 A590 7FE5 CA5F 3601  D1D5 8FBA 7744 CC87 10D0 ***

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160311/56b1db34/attachment.asc>
