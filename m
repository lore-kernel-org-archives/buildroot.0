From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Aug 2016 03:03:00 +0200
Subject: [Buildroot] [PATCH] mpv: bump to version 0.19.0
In-Reply-To: <20160820223919.146ed7c0@free-electrons.com>
References: <1471704131-5919-1-git-send-email-gustavo@zacarias.com.ar>
 <20160820223919.146ed7c0@free-electrons.com>
Message-ID: <f7de6131-8362-08df-a114-349a212eed54@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-08-16 22:39, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 20 Aug 2016 11:42:11 -0300, Gustavo Zacarias wrote:
>> And drop upstreamed patch.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>  .../mpv/0002-wscript-improve-stdatomic-check.patch | 47 ----------------------
>>  package/mpv/mpv.hash                               |  2 +-
>>  package/mpv/mpv.mk                                 |  2 +-
>>  3 files changed, 2 insertions(+), 49 deletions(-)
>>  delete mode 100644 package/mpv/0002-wscript-improve-stdatomic-check.patch
> 
> I'm glad to see that my efforts to upstream those fixes allow us to
> drop patches. That said, the patch did not exist in next, where I
> applied your patch, so the final commit is just a regular bump.

 So, you have to remember to drop the patch when you merge next into master...

 Wouldn't it be a good idea to regularly merge master into next? That would
reduce the likelihood of forgetting such things.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
