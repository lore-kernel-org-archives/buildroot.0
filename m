From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Dec 2013 07:08:29 -0300
Subject: [Buildroot] [PATCH 1/5] coreutils: belongs to system tools,
 not development
In-Reply-To: <20131203095920.1e46375f@skate>
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>	<87zjoipdlk.fsf@dell.be.48ers.dk>
 <20131203095920.1e46375f@skate>
Message-ID: <529DAD9D.6070400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/03/2013 05:59 AM, Thomas Petazzoni wrote:

>> Committed, thanks.
>>
>> I'm really starting to think we should get rid of
>> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, or atleast make it default y.
>>
>> Comments, anybody?
> 
> We've always said that it was important to keep this option so that
> newcomers don't enable things like coreutils, bash and so on, and use
> what I'd consider the default "Buildroot experience", i.e Busybox.
> 
> What made you change your mind about this?

/me thinks he got some patch conflict or something like that :)
We can always make it per-package in package/x/Config.in -> depends on
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS to avoid those issues.
For me it's default y whenever i use BR, however i have no strong
opinion either way.
Regards.
