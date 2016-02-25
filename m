From: Andreas Ehmanns <universeii@gmx.de>
Date: Thu, 25 Feb 2016 21:02:07 +0100
Subject: [Buildroot] [PATCH 1/1] Added OK/FAIL output to SNMP init
	script.
In-Reply-To: <20160225104643.0921463c@free-electrons.com>
References: <1456335081-4834-1-git-send-email-universeII@gmx.de>
 <20160225104643.0921463c@free-electrons.com>
Message-ID: <56CF5DBF.2060109@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
thanks for the feedback. I will prepare several patches including 
smaller changes and re-submit them.

Regards,
Andreas

Am 25.02.2016 um 10:46 schrieb Thomas Petazzoni:
> Dear Andreas Ehmanns,
>
> On Wed, 24 Feb 2016 18:31:21 +0100, Andreas Ehmanns wrote:
>> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
>> ---
>>   package/netsnmp/S59snmpd | 98 +++++++++++++++++++++++++++---------------------
>>   1 file changed, 56 insertions(+), 42 deletions(-)
> While your patch looks OK, it is doing *much* more than "adding
> OK/FAIL" as your commit title indicates.
>
> Ideally, you should separate your changes into multiple patches to make
> it easier to review the changes (like one patch to change to use
> functions, one patch to add OK/FAIL, one patch to remove set -e, etc.).
> Or at least, write a commit log that details all the changes that are
> being done.
>
> Thanks a lot!
>
> Thomas
