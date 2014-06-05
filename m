From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 05 Jun 2014 09:02:58 -0300
Subject: [Buildroot] [PATCH] wpa_supplicant: bump to version 2.2
In-Reply-To: <20140605115328.GN4193@tarshish>
References: <1401968217-32326-1-git-send-email-gustavo@zacarias.com.ar>
 <20140605115328.GN4193@tarshish>
Message-ID: <53905C72.5000202@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/05/2014 08:53 AM, Baruch Siach wrote:

>> -	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
>> +	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP CONFIG_INTERWORKING
> 
> But now CONFIG_INTERWORKING is never enabled. Am I missing something?

True, and also it doesn't depend on EAP, it depends on HS20 which we
don't enable but i think it would be good to do so for AP_SUPPORT.
This calls for a v2.
Thanks.
Regards.
