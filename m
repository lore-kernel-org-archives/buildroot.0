From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 06 Sep 2011 10:40:06 -0300
Subject: [Buildroot] [PATCH 12/13] busybox: add 1.19.x branch and remove
 deprecated
In-Reply-To: <20110905085053.72a5c581@skate>
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
 <1314972301-5067-14-git-send-email-gustavo@zacarias.com.ar>
 <20110905085053.72a5c581@skate>
Message-ID: <9d923fc926a7c3b6f221d05a6b839ab3@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 5 Sep 2011 08:50:53 +0200, Thomas Petazzoni wrote:

> Hello,
>
> Le Fri,  2 Sep 2011 11:05:00 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>>  config BR2_BUSYBOX_VERSION
>>  	string
>> -	default "1.15.3"	if BR2_BUSYBOX_VERSION_1_15_X
>>  	default "1.16.2"	if BR2_BUSYBOX_VERSION_1_16_X
>>  	default "1.17.4"	if BR2_BUSYBOX_VERSION_1_17_X
>>  	default "1.18.5"	if BR2_BUSYBOX_VERSION_1_18_X
>> +	default "1.19.0"	if BR2_BUSYBOX_VERSION_1_19_X
>
> I guess we could also set 1.16.x and 1.17.x as deprecated. For 
> Busybox,
> there really isn't much reason to support 4-5 different versions.
> Supporting the last two ones seems sufficient to me.
>
> Thomas

Yes, we should deprecate them for now.
Sent a revised patch with the new 1.19.2 version and 1.16.x & 1.17.x 
marked as deprecated.
Regards.
