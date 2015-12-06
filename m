From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 06 Dec 2015 21:33:31 +0100
Subject: [Buildroot] [PATCH] gcc: bump 5.x series to version 5.3.0
References: <1449428596-26365-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <rliejcxinh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 06 Dec 2015 16:03:16 -0300 schrieb Gustavo Zacarias:

> -	default "5.2.0"     if BR2_GCC_VERSION_5_X
> +	default "5.3.0"     if BR2_GCC_VERSION_5_X

Hi Gustavo,

I gave gcc-5.3.0 a shot at my private Kodi Jarvis-16.0 beta3 repo. 
Compilation of Kodi and all its addons/dependencies went well without 
problems.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd
