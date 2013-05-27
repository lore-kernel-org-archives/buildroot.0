From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 May 2013 13:42:49 -0300
Subject: [Buildroot] [PATCH 1/2] mxs-bootlets: add support for custom
 patches
In-Reply-To: <519C6D64.8040109@mind.be>
References: <1368905110-23303-1-git-send-email-gustavo@zacarias.com.ar>
 <519C60D6.5040207@mind.be> <20130522085804.5dbbbf4b@skate>
 <519C6D64.8040109@mind.be>
Message-ID: <51A38D09.3040201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/22/2013 04:01 AM, Arnout Vandecappelle wrote:

>> Also, what about the existing *_CUSTOM_PATCH_DIR config options we have
>> for Linux, U-Boot, Barebox and a bunch of other boot/kernel packages?
> 
>  Here also I'm in favour of deprecating them.
> 
>  But probably it's better to start using the global patch dir now, and
> only start deprecating the old ways next year.
> 
> 
>  Regards,
>  Arnout

Ok, let's go for BR2_GLOBAL_PATCH_DIR, sent a V2 respinned.
Regards.
