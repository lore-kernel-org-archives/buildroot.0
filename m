From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Mon, 13 Feb 2017 10:10:00 +0000
Subject: [Buildroot] [PATCH] motion: disable autotools host optimization
In-Reply-To: <20170211151850.11e14f69@free-electrons.com>
References: <1486723019-97464-1-git-send-email-ray.kinsella@intel.com>
 <20170211151850.11e14f69@free-electrons.com>
Message-ID: <a5f1e3c2-1499-724d-fa11-9ddea22c2b5b@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most welcome.

Ray K

On 11/02/2017 14:18, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 10 Feb 2017 10:36:59 +0000, Ray Kinsella wrote:
>> The motion autotools script helpfully detects the host
>> Microprocessors intr set and optimizes for it.
>> Disabling this feature causes autotools to use the
>> target parameters passed by BR instead.
>>
>> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
>> ---
>>  package/motion/motion.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Applied to master, thanks.
>
> Thomas
>
