From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 30 Mar 2014 15:55:33 +0200
Subject: [Buildroot] [PATCH 2/2] libcgicc: bump to version 3.2.13
In-Reply-To: <20140330113051.5c43cc69@skate>
References: <1396135140-1402-1-git-send-email-gustavo@zacarias.com.ar>
 <1396135140-1402-2-git-send-email-gustavo@zacarias.com.ar>
 <20140330113051.5c43cc69@skate>
Message-ID: <53382255.4090603@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> Dear Gustavo Zacarias,
>
> On Sat, 29 Mar 2014 20:19:00 -0300, Gustavo Zacarias wrote:
>> Also add license files and docs license definition.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>   package/libcgicc/libcgicc.mk | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> Applied, thanks, with one minor change.
>
>> +LIBCGICC_LICENSE = LGPLv3+, docs: GFDL1.2+
>
> I've changed this to the more traditional:
>
> 	LGPLv3+ (library), GFDL1.2+ (docs)
>
> Though I'm wondering if:
>
>   * We shouldn't use GFDLv1.2+ instead, like we do for GPL/LGPL.

Unless there is a good reason, we should the same style for all
licenses.

So, yes, we should use GFDLv1.2+.

Or... We may sync with SPDX: GPL-3.0, LGPL-2.1+, BSD-3-Clause, etc.

>
>   * Whether we should really worry about the documentation license,
>     since we don't allow the installation of the documentation on the
>     target. I don't think we have any other package that describe the
>     license of their documentation.

I'm quite neutral on this point, but I would like at least a comment to
make it clear that whoever added the license info has checked, not just
missed the other license(s).

Example:

   # The docs are GFDLv1.2+, but not installed
   LIBFOO_LICENSE = LGPLv3+



-- 
Luca
