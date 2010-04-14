From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 14:52:27 +0100
Subject: [Buildroot] [PATCH 15/16] xserver_xorg-server: bump version,
 improve option support
In-Reply-To: <m2kbadfd5ba1004140609pa2dc67cv5396a684c87bebbd@mail.gmail.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>	
	<1270126006-22405-15-git-send-email-will_wagner@carallon.com>
	<m2kbadfd5ba1004140609pa2dc67cv5396a684c87bebbd@mail.gmail.com>
Message-ID: <4BC5C89B.9060703@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/04/2010 14:09, Paulius Zaleckas wrote:
> On Thu, Apr 1, 2010 at 3:46 PM, Will Wagner<will_wagner@carallon.com>  wrote:
>    
>> Later version of xserver no longer need configure hack to say where
>> mesa3d is located.
>>
>> Signed-off-by: Will Wagner<will_wagner@carallon.com>
>>      
> Seems that my ACK was little bit too early...
>
>    
>
>> +
>>   ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
>>   XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
>>   XSERVER_XORG_SERVER_CONF_OPT += --enable-dri2
>>   endif
>>      
> But I have added this in my previous patches! And I think it is more correct,
> since not all drivers need it.
>
>    
Ok, missed that. Will fix and resubmit.
