From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Fri, 14 Oct 2016 11:45:15 -0300
Subject: [Buildroot] [PATCH 04/51] lz4: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <ddcb7624-d3ed-20fd-e2a0-dd0ee6eeaa26@mind.be>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-5-git-send-email-gustavo.zacarias@free-electrons.com>
 <ddcb7624-d3ed-20fd-e2a0-dd0ee6eeaa26@mind.be>
Message-ID: <59101c06a00a07b68e37c14be5fe3e6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-10-14 11:40, Arnout Vandecappelle wrote:

> On 14-10-16 00:13, gustavo.zacarias at free-electrons.com wrote:

>> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>> 
>> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>> ---
>>  package/lz4/lz4.mk | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
>> index a5a41d3..f96e279 100644
>> --- a/package/lz4/lz4.mk
>> +++ b/package/lz4/lz4.mk
>> @@ -27,16 +27,16 @@ define HOST_LZ4_INSTALL_CMDS
>>  endef
> 
>  Could you add a patch that does the same for host-lz4 as well?
> 
>  Regards,
>  Arnout

Hi.
Yes, i'll handle that on a separate series.
Regards.
