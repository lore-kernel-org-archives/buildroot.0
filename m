From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 12:11:49 -0300
Subject: [Buildroot] [PATCH 04/15] toolchain: remove LARGEFILE selects
In-Reply-To: <20150314223621.GI4009@free.fr>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-5-git-send-email-gustavo@zacarias.com.ar>
 <20150314223621.GI4009@free.fr>
Message-ID: <55084435.6050806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/14/2015 07:36 PM, Yann E. MORIN wrote:

> Gustavo, All,
> 
> On 2015-03-13 15:22 -0300, Gustavo Zacarias spake thusly:
>> There's no need for toolchains or the user to declare largefile support
>> since it's now mandatory.
> 
> With the new patch I suggested you had before patch 3, do not forget to
> also remove the select from BR2_TOOLCHAIN_BUILDROOT_LARGEFILE in this
> patch.
> 
> Regards,
> Yann E. MORIN.

The only place where BR2_TOOLCHAIN_BUILDROOT_LARGEFILE is selected/used
is in defconfigs, so there's no need for anything additional in this
patch (that's handled in patch 8).
Regards.
