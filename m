From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 22 Jul 2015 12:29:24 +0200
Subject: [Buildroot] [PATCH 01/11] package/ulogd: remove autoreconf
In-Reply-To: <20150720225609.6644867c@free-electrons.com>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
 <20150720225609.6644867c@free-electrons.com>
Message-ID: <55AF7084.9020601@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 20/07/2015 22:56, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Mon, 20 Jul 2015 19:47:49 +0200, Romain Naour wrote:
>> Autoreconf is not needed anymore since ulogd 2.0.4
>> where logd-01-pthread-conditional.patch was removed.
>>
>> commit: 010745a955b6cf4c979588fafdb7506460038e0f
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/ulogd/ulogd.mk | 1 -
>>  1 file changed, 1 deletion(-)
> 
> All 11 patches applied, thanks. I have not tested them, I trust you :)
> The autobuilders will tell me if I was right or not! :-)

I haven't see any build failure due to this series :)
So, I guess you was right but maybe there are too many build failure in
autobuilders to see something ;-)

Seriously, I've tested each packages by selecting each of them in the config and
build the entire config to see if all build fine.

Thanks,
Romain

> 
> Thanks!
> 
> Thomas
> 
