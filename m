From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Tue, 08 Sep 2015 14:14:47 +0200
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH=5D_Makefile=3A_Remove_KBUILD=5FVER?=
 =?utf-8?q?BOSE_and_quiet?=
In-Reply-To: <55EDFE3E.8030205@mind.be>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <55EDFE3E.8030205@mind.be>
Message-ID: <d72ff365b4711836e5c1990f7b72923c@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 2015-09-07 23:14, Arnout Vandecappelle a ?crit?:
>  Don't forget to version your patches and keep a patch changelog...

I had this remark in mind - you told me some time ago - but I intended 
to do it with the patch that will handle verbosity in infrastructures. I 
kind of considered this one as a new one.
Since the patch has been split into several patches, should I increment 
the version for every new patch?


>  I would already have introduced the VERBOSE construct in this patch, 
> but I
> guess this one is less controversial, so OK.

I have tried to follow your guidelines:

> 1. Remove KBUILD_VERBOSE and quiet (this one will be uncontroversial I 
> think)
> 2. Define VERBOSE based on V= passed on command line
> 3. Use VERBOSE in autotools and cmake
> 4. Update documentation.


Do you confirm I still should send two separate patches for steps 2 and 
3?

Regards,

-- 
C?dric
