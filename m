From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 May 2016 11:06:57 -0300
Subject: [Buildroot] [PATCH 2/2] connman: remove xtables build fix patch
In-Reply-To: <20160519160603.3debab78@free-electrons.com>
References: <1463664337-881-1-git-send-email-gustavo@zacarias.com.ar>
 <1463664337-881-2-git-send-email-gustavo@zacarias.com.ar>
 <20160519160603.3debab78@free-electrons.com>
Message-ID: <573DC881.2030409@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/05/16 11:06, Thomas Petazzoni wrote:

> Hello,
>
> On Thu, 19 May 2016 10:25:37 -0300, Gustavo Zacarias wrote:
>> This was added in 0dece985 to deal with kernel headers 4.5 -> 4.5.4
>> breakage. Unfortunately the fix in 4.5.5 and 4.6+ doesn't deal correctly
>> with this causing more build breakage, so we'd rather "break" for the
>> small range of 4.5.x versions broken than for the rest of time.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>   package/connman/0001-xtables.patch | 61 --------------------------------------
>>   1 file changed, 61 deletions(-)
>>   delete mode 100644 package/connman/0001-xtables.patch
>
> Does this fixes some autobuilder failures?

Hi.
Not right now since 4.6 is in -next, however it will if the stable 
headers are bumped to 4.5.5.
Regards.
