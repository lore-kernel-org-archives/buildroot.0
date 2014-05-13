From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 21:03:49 -0700
Subject: [Buildroot] [PATCH v3 1/8] package/gdb: add gdb 7.7.x (7.7.1)
 and 7.6.x (7.6.2)
In-Reply-To: <20140513035044.GU4096@tarshish>
References: <1399941203-8282-1-git-send-email-cody@linux.vnet.ibm.com>
 <1399941203-8282-2-git-send-email-cody@linux.vnet.ibm.com>
 <20140513035044.GU4096@tarshish>
Message-ID: <537199A5.4090404@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/2014 08:50 PM, Baruch Siach wrote:
> Hi Cody,
>
> On Mon, May 12, 2014 at 05:33:16PM -0700, Cody P Schafer wrote:
>> To prep for powerpc64le, we also disable gdb prior to 7.7.1 on
>> powerpc64le.
>>
>> The default gdb on powerpc64le is set to 7.7.
>> The default gdb on anything not special cased is adjusted from 7.5 to
>> 7.6.
>
> This patch should be split into two IMO. One patch adding gdb 7.6 and making
> it default, and the other adding 7.7 for powerpc64le. This would ease somewhat
> the pain of reverting the 7.6 bump in case it turns out to be not a good idea.
>

To make it even easier, I just made the default change a seperate patch. 
Take a look at v4.
