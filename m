From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Wed, 4 May 2016 11:22:24 -0400 (EDT)
Subject: [Buildroot] [PATCH v1 1/4] libpjsip: add gnutls support and fix
 various things
In-Reply-To: <59f2bcec-6b91-7ddf-0a79-f5a85d6383fa@mind.be>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1461358628-9352-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <20160422232155.6ac9c7e2@free-electrons.com>
 <1719666448.88685.1462309711357.JavaMail.zimbra@savoirfairelinux.com>
 <59f2bcec-6b91-7ddf-0a79-f5a85d6383fa@mind.be>
Message-ID: <23158982.107504.1462375344849.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On May 3, 2016, at 5:43 PM, Arnout Vandecappelle arnout at mind.be wrote:
> On 05/03/16 23:08, Patrick Keroulas wrote:
>> Hello Thomas,
>> 
>> On Apr 22, 2016, at 5:21 PM, Thomas Petazzoni
>> thomas.petazzoni at free-electrons.com wrote:
>>> However, Buildroot has the policy of not carrying feature patches,
>>> which this one clearly is. Some please get this patch integrated
>>> upstream first, and then we can benefit from this feature in Buildroot.
>>> 
>>> Having large feature patches like this one in Buildroot would prevent
>>> us from easily updating libpjsip in the future, which is not a
>>> situation we like.
>> 
>> We've been trying to push these patches up-stream for 2 years now, without
>> response from pjproject.
>> http://lists.pjsip.org/pipermail/pjsip_lists.pjsip.org/2014-May/017492.html
>> http://lists.pjsip.org/pipermail/pjsip_lists.pjsip.org/2015-January/018072.html
> 
> Well, in that case, we're even less motivated to carry these feature patches...
> 
> But you can easily keep it in your own BR2_GLOBAL_PATCH_DIR.

What if my intended package (ring-daemon in patch 4/4) doesn't even build 
without this gnutls support in libpjsip?
Is it acceptable to include <global-patch-dir> in package/ring-daemon/?
Do I have an alternative?

Regards,

Patrick
