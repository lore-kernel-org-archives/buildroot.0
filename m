From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Dec 2016 16:15:55 +0100
Subject: [Buildroot] [PATCH v2 1/3] core: waf-package infra: allow to
 override <pkg>_INSTALL_*_OPTS
In-Reply-To: <20161211153203.0cbe8092@free-electrons.com>
References: <1480889938-11075-1-git-send-email-romain.naour@gmail.com>
 <20161211153203.0cbe8092@free-electrons.com>
Message-ID: <940e8d4e-936d-d873-dd18-2f79669e2b3a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 11/12/2016 ? 15:32, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun,  4 Dec 2016 23:18:56 +0100, Romain Naour wrote:
>> Some waf packages may want to pass additional variables to waf script
>> in install step.
>> Allow to override <pkg>_INSTALL_*_OPTS like it's done in other package
>> infra.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> ---
>> v2: override <pkg>_INSTALL_*_OPTS (Yann)
>> ---
>>  package/pkg-waf.mk | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> I've applied the entire series to master, after doing some minor tweaks
> here and there. Please send a follow-up patch that updates the
> Buildroot manual section for the waf package infrastructure.

Done:
http://patchwork.ozlabs.org/patch/704842/

Thanks,
Romain

> 
> Thanks!
> 
> Thomas
> 
