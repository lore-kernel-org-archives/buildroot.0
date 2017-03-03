From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 12:31:00 +0100
Subject: [Buildroot] [PATCH v2] package/can-utils: add license
 information
In-Reply-To: <68ff344f-81de-b4a4-9762-b117154cd751@grandegger.com>
References: <68ff344f-81de-b4a4-9762-b117154cd751@grandegger.com>
Message-ID: <20170303123100.6ce4254a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Mar 2017 12:26:01 +0100, Wolfgang Grandegger wrote:

>  CAN_UTILS_VERSION = c3305fdd515464153d20199db232b6124bc962c0
>  CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
> +CAN_UTILS_LICENSE = BSD-3c or GPLv2, GPLv2+

As I said in my previous review, could you identify which parts are
under which license?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
