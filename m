From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 16:26:01 +0200
Subject: [Buildroot] [PATCH v6 02/10] package/patchelf: add patch for
 rpath sanitization under a root directory
In-Reply-To: <33b116c3-f111-5e13-119f-7fe77ab2e33f@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
 <1499185359-8293-3-git-send-email-wg@grandegger.com>
 <20170705131600.05eadaa9@windsurf>
 <33b116c3-f111-5e13-119f-7fe77ab2e33f@grandegger.com>
Message-ID: <b260bf6d-e5a9-d227-9e3d-74d19747eb4e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 14:35, Wolfgang Grandegger wrote:
> Hello,
> 
> Am 05.07.2017 um 13:16 schrieb Thomas Petazzoni:
>> Hello,
>>
>> On Tue,  4 Jul 2017 18:22:31 +0200, Wolfgang Grandegger wrote:
>>
>>> diff --git
>>> a/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
>>> b/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
>>> new file mode 100644
>>> index 0000000..46fd123
>>> --- /dev/null
>>> +++ b/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
>>> @@ -0,0 +1,49 @@
>>> +From a365bcb7d7025da51b33165ef7ebc7180199a05e Mon Sep 17 00:00:00 2001
>>> +From: Eelco Dolstra <eelco.dolstra@logicblox.com>
>>> +Date: Mon, 19 Sep 2016 17:31:37 +0200
>>> +Subject: [PATCH 14/30] Remove apparently incorrect usage of "static"
>>
>> The 14/30 should be removed, just make it [PATCH]
>>
>>> +
>>
>> Please add here:
>>
>> [Upstream commit: URL of the upstream commit.]
>> Signed-off-by: ...
> 
> They (patchelf developers) don't add "Signed-off-by". Should I add mine anyway?

 You should add yours in the Buildroot patch, yes, as well as a reference to the
upstream commit. See e.g.
package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch

[snip]
>> If this has been accepted upstream, add the URL to the upstream commit
>> here as well.
> 
> So far there was now response to my GitHub-Merge-Request. And it's now based on
> v0.9 for the known reasons.

 Even if the patch differs from the upstream patch, you should still point to
the upstream pull request so people can check it out when they want to bump
patchelf.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
