From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sun, 17 Aug 2014 22:51:14 +0200
Subject: [Buildroot] [PATCH 1/1] odhcploc: new package
In-Reply-To: <20140817213415.5ea4809a@free-electrons.com>
References: <1407607617-18039-1-git-send-email-bos@je-eigen-domein.nl>
 <20140817213415.5ea4809a@free-electrons.com>
Message-ID: <53F115C2.4060907@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/17/2014 09:34 PM, Thomas Petazzoni wrote:
> On Sat,  9 Aug 2014 20:06:57 +0200, Floris Bos wrote:
>> Adds odhcploc, a network utility to scan for (rogue) DHCP servers.
>>
>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> Thanks, I've applied the patch to the next branch, after doing a few
> changes, see below.

Thanks for applying.


> +define ODHCPLOC_BUILD_CMDS
> +     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> Used tab for indentation instead of spaces, and replaced CC=.. LD=.. by
> $(TARGET_CONFIGURE_OPTS).

Fine with me.
Had copied the CC=.. LD=.. construct from the manual though ( 
http://www.buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems 
)
Perhaps mention $(TARGET_CONFIGURE_OPTS) there as well?

-- 
Yours sincerely,

Floris Bos
