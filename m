From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 16 May 2014 11:12:40 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-stats: add luarocks perl python
 virtual infrastructures
In-Reply-To: <20140516093142.29f7c4e6@free-electrons.com>
References: <1400066654-32196-1-git-send-email-fabio.porcedda@gmail.com>
 <20140516093142.29f7c4e6@free-electrons.com>
Message-ID: <CAHkwnC8OYTGVL__aCHLW3nVHchYXBQ1y4XPGRqFuFU3frAzuzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 16, 2014 at 9:31 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Wed, 14 May 2014 13:24:13 +0200, Fabio Porcedda wrote:
>> Recongize the recently added infrastrucures: luarocks, perl, python,
>> virtual.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>  support/scripts/pkg-stats | 71 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 71 insertions(+)
>
> Today's output is now correct thanks to your patch:
> http://autobuild.buildroot.org/stats/. And it now properly concludes
> that there are 0 packages not using any infrastructure \o/

Yeah that's great, packages not using any infrastructure are
problematic for top level parallel make so I was glad to find that
there aren't such packages.

> Thanks for having worked on updating this script!

Best regards
-- 
Fabio Porcedda
