From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sat, 10 Sep 2016 14:09:37 +0200
Subject: [Buildroot] [PATCH v2] openal: Explicitly enable/disable NEON
 support
In-Reply-To: <20160906222510.17123fa6@free-electrons.com>
References: <1472754894-6903-1-git-send-email-nerv@dawncrow.de>
 <20160906222510.17123fa6@free-electrons.com>
Message-ID: <9791f7f9-3928-8f8f-b68b-1d1c65639d27@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 06.09.2016 um 22:25 schrieb Thomas Petazzoni:
> Hello,
> 
> On Thu,  1 Sep 2016 20:34:54 +0200, Andr? Hentschel wrote:
>> Fixes:
>> http://autobuild.buildroot.net/results/d7ccef77a355ccc23f26d012e8441af931469ae4
>> http://autobuild.buildroot.net/results/b5777a0ed33f6bb7a5fc0486ea21ecef58615dac
>>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> 
> What about instead:
> 
>   https://github.com/kcat/openal-soft/pull/64
> 
> to fix this issue (I tested, it fixes the build failure).
> 
> Thomas
> 

Sorry was on a business trip.
As it is upstream meanwhile (together with a runtime neon check suggested by you) I'm fine with a patch added to the openal package.
It's your work, so be free to do so.
Or do you know about plans of an upcoming openal bugfix release? That'd be easier I guess
