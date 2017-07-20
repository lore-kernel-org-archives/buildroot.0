From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 12:45:38 +0200
Subject: [Buildroot] [PATCH v7 5/9] core: sanitize RPATH in host tree at
 the very end of the build
In-Reply-To: <e42af315-8309-d086-0722-99ca20b62f52@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-6-git-send-email-wg@grandegger.com>
 <4e228fa3-0126-6752-8a98-e17967b61fb3@mind.be>
 <e869c949-611c-ecb8-98f7-e436aae1e489@grandegger.com>
 <95606480-04d3-8486-ed26-baccddc5e18e@mind.be>
 <e42af315-8309-d086-0722-99ca20b62f52@grandegger.com>
Message-ID: <18fa3eee-9402-0e3b-d3e0-02c5d0646fd7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 11:15, Wolfgang Grandegger wrote:
> 
> 
> Am 20.07.2017 um 10:49 schrieb Arnout Vandecappelle:

[snip]
>>   Well, just rename host-finalize to sdk, and remove it from the dependencies of
>> "world". Oh, and add it to the 'make help' output.
>>
>>   Documentation should be added as well, but that should be done anyway (to
>> explain that the relocate-sdk script should be called).
> 
> OK, just to double-check. "make sdk" will sanitize the staging and host tree and
> add relocate-sdk.sh. But the target tree will always be sanitized.

 Exactly!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
