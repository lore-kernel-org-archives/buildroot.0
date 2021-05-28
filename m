From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 May 2021 18:10:29 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix NGINX pidfile handling
 systemd
In-Reply-To: <87h7im271k.fsf@dell.be.48ers.dk>
References: <20210521144149.35725-1-matthew.weber@collins.com>
 <20210526204856.GP3208066@scaer>
 <a6b5f2ef-b33a-e300-9e0b-478ea2296969@mind.be>
 <20210528113959.GB2788252@scaer>
 <4f98da29-4eb3-e5af-2139-a55d6defa12e@mind.be>
 <20210528131252.GF2788252@scaer>
 <3879e8a9-c21d-6381-2348-ae1d291ba63c@mind.be>
 <87h7im271k.fsf@dell.be.48ers.dk>
Message-ID: <1b2fee92-2752-c02d-93a3-6ad716ca5259@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2021 17:48, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >  I'm thinking (adding Peter in Cc) that we should maybe do better on the release
>  > notes. Yocto (ever our example) puts a (now very long) "Migrating to a Newer
>  > Yocto Project Release" [1] directly in their documentation with a description of
>  > every release. We do have an upgrading section, but maybe we should put any
>  > caveats directly in there instead of trying to compile them at release time in
>  > the CHANGES file.
> 
> Yes, I agree. We already have a section in the manual for it:
> 
> https://github.com/nginxinc/docker-nginx/blob/master/Dockerfile-debian.template#L106

 I think you meant

https://buildroot.org/downloads/manual/manual.html#migrating-from-ol-versions

:-)


> But very little content :/ Patches accepted!

 What I meant is: we should require an update of that section whenever there's a
potentially breaking change. From 2021.05-rc1, for example:

        FORTIFY_SOURCE, PIC/PIE, RELRO and SSP security hardening
        options are now enabled by default.

The change of the default could have updated that section in the same patch.


 Regards,
 Arnout
