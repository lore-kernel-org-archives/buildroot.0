From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 20 May 2016 23:07:17 +0200
Subject: [Buildroot] [PATCH v3 next] openblas: new package
In-Reply-To: <20160520110001.026d8cc6@free-electrons.com>
References: <1463652602-3276-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160519142103.507c1395@free-electrons.com> <573DC2D6.5090003@imgtec.com>
 <20160519160040.1eee27e6@free-electrons.com> <573ECB77.9080100@imgtec.com>
 <20160520110001.026d8cc6@free-electrons.com>
Message-ID: <CAHXCMMKz9DXeajqsv2_+N2Cwo6Q6H5njKoUrZpRSXFu7QFD4TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente, all,

On Fri, May 20, 2016 at 11:00 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 20 May 2016 09:31:51 +0100, Vicente Olivert Riera wrote:
>
>> do you have those patches Thomas is talking about? If so, do you plan to
>> send them to the ML?
>
> See: https://github.com/tSed/buildroot/commits/sma/ext-toolchain-options

Yes, I will send them at some point ;-)
In its current state the branch should be easily rebased on master I think.
But there is some part of this work that could benefit from the shell
module work from this series [1], so I'm waiting for this series [1]
to be merged before.
I plan to poke people about [1] as soon as the 2016.05 release is out,
and continue works based on it.


[1] http://patchwork.ozlabs.org/bundle/smartin/rpath_v9_part01/

Regards,

-- 
Samuel
