From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 3 May 2016 16:56:12 -0300
Subject: [Buildroot] [PATCH 3/3] gst1-plugins-bad: add rtmp support
In-Reply-To: <572901AF.6030003@dawncrow.de>
References: <1462304656-17156-1-git-send-email-gustavo@zacarias.com.ar>
 <1462304656-17156-3-git-send-email-gustavo@zacarias.com.ar>
 <572901AF.6030003@dawncrow.de>
Message-ID: <5729025C.3080301@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/16 16:53, Andr? Hentschel wrote:

>> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP
>> +	bool "rtmp"
>> +	select BR2_PACKAGE_RTMPDUMP
>> +	help
>> +	  RTMP plugni
>
> just caught that typo while looking at the patch...

Hi.
Thanks, too quick a patch, i'll send v2.
Regards.
