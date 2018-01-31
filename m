From: daggs <daggs@gmx.com>
Date: Wed, 31 Jan 2018 09:24:06 +0100
Subject: [Buildroot] buildroot imagw upgrade
In-Reply-To: <87shap83b1.fsf@dell.be.48ers.dk>
References: <trinity-7ce85c6f-3278-4055-8377-0c3a03dd9a1a-1516300080914@3c-app-mailcom-bs09>
 <87shaqdjqm.fsf@dell.be.48ers.dk>
 <trinity-01900f6e-e7da-4b49-b3b3-4f08bea4a85f-1517212721295@3c-app-mailcom-bs04>
 <87shap83b1.fsf@dell.be.48ers.dk>
Message-ID: <trinity-bb75b6cb-06d4-4eda-8a00-79d2bb8fb9a6-1517387046744@3c-app-mailcom-bs07>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Peter,

>
> >>>>> "daggs" == daggs  <daggs@gmx.com> writes:
> 
> Hi,
> 
>  > I have a dtv server running image based on buildroot, it gets stuck
>  > every day requiring me to reboot it.  I want to upgrade the image but
>  > I have data and config I want to keep.
> 
> And you have not separated your data/config from the buildroot image
> (E.G. on another filesystem)?
> 
beside the need to gamble on how much size to allocate each partition, it is impossible to maintain the upgrade path and save folders like /etc/ and firmwares.

> > my first idea was to preform and upgrade, that is why I'm asking.
> 
> Upgrade handling is always quite system specific, and outside the scope
> of Buildroot.
> 
> We do provide a number of packages related to upgrade handling, but
> Buildroot is just a toolbox - It doesn't enforce any specific behaviour.
> 
I think the best way is to copy a rsync and use my local backup system to take out what I need from there prior to the actual upgrade.

Dagg.
