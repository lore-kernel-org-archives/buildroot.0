From: gregory hermant <gregory.hermant@calao-systems.com>
Date: Wed, 29 Aug 2012 16:01:42 +0200
Subject: [Buildroot] [PATCH] Add custom boards support for Atmel SAM-BA
 software
In-Reply-To: <20120829142151.20102d18@skate>
References: <503DE6F7.8050702@calao-systems.com>
 <20120829142151.20102d18@skate>
Message-ID: <503E20C6.4020904@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
The patch will include applets (binaries) for each board.
Do you prefer another way (for example a sam-ba package including the support of the calao board downloadable from our website) ? 
gregory

Thomas Petazzoni wrote:
> Le Wed, 29 Aug 2012 11:55:03 +0200,
> gregory hermant <gregory.hermant@calao-systems.com> a ?crit :
> 
>> +config BR2_TARGET_SAM_BA_CUSTOM_PATCH_DIR
> 
> This should be BR2_HOST_SAM_BA...
> 
> Also, could you send this together with another patch that actually
> uses this feature for at least one board, so we can see the type of
> patches that it is going to add?
> 
> Thanks!
> 
> Thomas
