From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jul 2019 11:02:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: Fix build with
 libnettle 3.5
In-Reply-To: <5e5kvfxj4m.ln2@ID-313208.user.individual.net>
References: <20190705043509.19163-1-bernd.kuhls@t-online.de>
 <0b1ec3a5-d5d2-f759-4987-948640c3264b@mind.be>
 <5e5kvfxj4m.ln2@ID-313208.user.individual.net>
Message-ID: <3baad348-d7df-1a43-c8e2-6f0d8656494e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/07/2019 18:41, Bernd Kuhls wrote:
> Am Thu, 11 Jul 2019 16:08:45 +0200 schrieb Arnout Vandecappelle:
> 
>> On 05/07/2019 06:35, Bernd Kuhls wrote:
>>> Fixes
>>
>>  Please put a colon behind Fixes, so patchworks picks it up.
> 
> Hi Arnout,
> 
> thanks for the hint, I did not know that.
> The docs also do not mention it: http://buildroot.uclibc.org/downloads/
> manual/manual.html#_analyzing_and_fixing_autobuild_failures

 Well, I actually just discovered it now. I'm not even 100% sure that this is
the issue, but I noticed patchwork didn't recognise this as a fix, and the only
thing I can see is this colon missing.

 Regards,
 Arnout
