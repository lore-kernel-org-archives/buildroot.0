From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 16 Sep 2015 09:59:48 -0500
Subject: [Buildroot] Question
In-Reply-To: <20150916145655.GM11632@tarshish>
References: <55F97C1E.1030206@synopsys.com> <20150916145655.GM11632@tarshish>
Message-ID: <CAMQcK5JeQjGb4__xSidgRFy7-2UPtBMiumQh2irWu_ewrjyA=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joao, Baruch,

On Wed, Sep 16, 2015 at 9:56 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Joao,
>
> On Wed, Sep 16, 2015 at 03:26:38PM +0100, Joao Pinto wrote:
>> Could you please tell me if it is possible to have a patch called
>> automatically that changes a certain file in the target root filesystem?
>
> You can use a post build script for that (BR2_ROOTFS_POST_BUILD_SCRIPT). See
> http://nightly.buildroot.org/manual.html#rootfs-custom.

As Baruch suggested or an overlay which contains your modified file
(BR2_ROOTFS_OVERLAY).

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
