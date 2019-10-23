From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 23 Oct 2019 18:10:46 +0200
Subject: [Buildroot] [PATCH 4/4] package/libnss: remove
 NSS_ENABLE_WERROR=0
In-Reply-To: <20191023175412.60404790@windsurf>
References: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
 <20191023102330.20842-4-giulio.benetti@benettiengineering.com>
 <20191023175412.60404790@windsurf>
Message-ID: <adb53c11-76f1-6dec-2179-bab8cdc242c3@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 10/23/19 5:54 PM, Thomas Petazzoni wrote:
> On Wed, 23 Oct 2019 12:23:30 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> All warnings have been fixed now, so let's remove NSS_ENABLE_WERROR and
>> leave any warning to show up.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> No, we generally don't want to enable -Werror in Buildroot builds, as
> warnings keep popping up when upgrading gcc versions.

Ok, then I'll fix warnings upstream and keep -Werror disabled.

Thanks for reviewing
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
