From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Jun 2021 08:20:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: fix installation of
 systemd units
In-Reply-To: <20210603195428.GG168928@scaer>
References: <cover.1621608266.git.yann.morin.1998@free.fr>
 <7aca7804d91a74070a56be2b9d8781eb0fd82446.1621608266.git.yann.morin.1998@free.fr>
 <5ace21b3-7b64-8c5a-3cb5-0d26bdd251d0@mind.be>
 <20210603195428.GG168928@scaer>
Message-ID: <25d14bb9-9e99-cadc-ac28-c61b880e518e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/06/2021 21:54, Yann E. MORIN wrote:
> Arnout, all,
> 
> On 2021-06-02 23:12 +0200, Arnout Vandecappelle spake thusly:
>> On 21/05/2021 16:44, Yann E. MORIN wrote:
>>> Since we bump the version in commit 80997acd3587 (package/lvm2: bump
>>> version to 2.03.12), the installation of systemd units is no longer
>>> functional without a full installation.
>>>
>>> As Pascal puts it: the systemd service files don't make a whole lot of
>>> sense when there isn't a full lvm2 install.
>>>
>>> Move the conditional block that install system units, so that it only
>>> occurs when we do a full installation.
>>>
>>> Fixes;
>>  In the future, please use a colon so patchwork picks it up as a fix :-)
> 
> Oh come on... It would mean I would have to hit the 'shift' key right
> before I hit the ';' key, not right after. This is too difficult for me
> to synchronise those two key hits right...
> 
> (If I had used an azerty keyboard, not an qwerty one, my excuse would
> have been that the ';' and ':' keys are too close to each other, and
> aiming for the correct key would too difficult for my fat fingers...)
> 
>>>     http://autobuild.buildroot.org/results/f47/f470ffb55625e2639cecde713442550eb532d0d7/
>>>     http://autobuild.buildroot.org/results/954/9547929292e81671fbe3a5b4bbc87a6424edb1ca/
>>>     http://autobuild.buildroot.org/results/303/30359c351a6ce2f9139494a531e036f0b0406ccf
>>> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>>> Co-Developped-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
>>> Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
>>> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>  Series applied to master, thanks.
> 
> As I understood, that's been applied ot both next and master. Thanks!

 No, only master. I didn't push next.

 Regards,
 Arnout
