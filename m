From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 18 Nov 2013 11:12:13 +0000
Subject: [Buildroot] [PATCH] Apply upstream patch to set correct linkage
 on MIPS64
In-Reply-To: <20131118120635.52bba816@skate>
References: <1384772206-57234-1-git-send-email-Vincent.Riera@imgtec.com>
 <20131118120635.52bba816@skate>
Message-ID: <5289F60D.7000805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/18/2013 11:06 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Mon, 18 Nov 2013 10:56:46 +0000, Vicente Olivert Riera wrote:
>> Acked-by: Markos Chandras <markos.chandras@imgtec.com>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   package/libtool/libtool-mips64-n64-linking.patch |   47 ++++++++++++++++++++++
>>   1 files changed, 47 insertions(+), 0 deletions(-)
>>   create mode 100644 package/libtool/libtool-mips64-n64-linking.patch
>
> This looks good, but:
>
>   * The title of your patch should start with "libtool: "
>
>   * You want to name the patch file libtool-0001-<something>.patch, as
>     per http://buildroot.org/downloads/manual/manual.html#patch-policy.
>
> Also, I believe your commit log should mention more precisely which
> problem it is fixing (I guess the most visible one is a build failure
> of libiscsi on MIPS64 n32, I'm sure Markos remembers the details).
>
> Thanks!
>
> Thomas
>
Hi Thomas,

Thanks for the comments. It does not fix anything yet (affected packages 
need to start using AUTORECONF), and the libiscsi is just one of the 
problems so we thought it shouldn't be part of the commit message.

I incorrectly thought that we do not use numbers for patches anymore.

v2 to follow soon!

-- 
markos
