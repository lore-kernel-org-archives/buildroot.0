From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 19 Oct 2012 10:08:43 +0200
Subject: [Buildroot] [PATCH] barebox: Allow to pass a custom
 configuration file
In-Reply-To: <50805F0A.7010407@mind.be>
References: <1350547405-31491-1-git-send-email-maxime.ripard@free-electrons.com>
 <50805F0A.7010407@mind.be>
Message-ID: <50810A8B.4020704@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 18/10/2012 21:56, Arnout Vandecappelle a ?crit :
> On 18/10/12 10:03, Maxime Ripard wrote:
>> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
> [snip]
>> +config BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE
>> +    string "Configuration file path"
>> +    depends on BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
>> +    help
>> +      Path to the kernel configuration file
>                       ^^^^^^
>                       barebox
> 
> [snip]
>> +ifeq ($(BAREBOX_SOURCE_CONFIG),)
>> +$(error No Barebox config file. Check your
>> BR2_TARGET_BAREBOX_BOARD_DEFCONFIG setting)
> 
>  or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE

Ah, yes, thanks

Maxime


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
