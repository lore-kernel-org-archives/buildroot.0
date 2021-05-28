From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 May 2021 18:42:33 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix NGINX pidfile handling
 systemd
In-Reply-To: <1b2fee92-2752-c02d-93a3-6ad716ca5259@mind.be> (Arnout
 Vandecappelle's message of "Fri, 28 May 2021 18:10:29 +0200")
References: <20210521144149.35725-1-matthew.weber@collins.com>
 <20210526204856.GP3208066@scaer>
 <a6b5f2ef-b33a-e300-9e0b-478ea2296969@mind.be>
 <20210528113959.GB2788252@scaer>
 <4f98da29-4eb3-e5af-2139-a55d6defa12e@mind.be>
 <20210528131252.GF2788252@scaer>
 <3879e8a9-c21d-6381-2348-ae1d291ba63c@mind.be>
 <87h7im271k.fsf@dell.be.48ers.dk>
 <1b2fee92-2752-c02d-93a3-6ad716ca5259@mind.be>
Message-ID: <87czta24jq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Yes, I agree. We already have a section in the manual for it:
 >> 
 >> https://github.com/nginxinc/docker-nginx/blob/master/Dockerfile-debian.template#L106

 >  I think you meant

 > https://buildroot.org/downloads/manual/manual.html#migrating-from-ol-versions

Hah, indeed ;)


 >> But very little content :/ Patches accepted!

 >  What I meant is: we should require an update of that section whenever there's a
 > potentially breaking change. From 2021.05-rc1, for example:

 >         FORTIFY_SOURCE, PIC/PIE, RELRO and SSP security hardening
 >         options are now enabled by default.

 > The change of the default could have updated that section in the same patch.

Yes, I agree. I will try to remind contributors in the future.

-- 
Bye, Peter Korsgaard
