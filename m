From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 29 Apr 2016 20:12:20 +0200
Subject: [Buildroot] 2016.05-rc1 approaching: what to merge?
In-Reply-To: <20160428160000.5db9d1cb@free-electrons.com>
References: <20160428160000.5db9d1cb@free-electrons.com>
Message-ID: <CAAXf6LV+9sZcn3FuCcj5VCfu+Ao4aFUZGYt4vbbm8MiXSOhPig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Apr 28, 2016 at 4:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> We're approaching the end of April, and therefore the beginning of May,
> which means that 2016.05-rc1 will be released soon, most likely in
> about a week.
>
> As a reminder, once -rc1 is released, we don't merge new packages or
> version bumps, but only build fixes, security fixes, documentation
> updates, etc. Of course, anything that doesn't get merged before -rc1
> can be merged for the next release, 2016.08.
>
> So the question is: we have ~230 patches pending patchwork. Do you see
> anything that we should really merge before 2016.05-rc1 is released?

I just submitted three patches:
- opkg: this is a build fix, I think it would best go in 2016.05
- ccache: this is also a build fix, but only triggered if you manually
run 'make host-ccache' as opposed to a standard build. I think it is a
trivial fix, but not mandatory for 2016.05. For you to decide how to
handle it.
- gdb wrapper: this was submitted first at the developer days in
February. I kind of forgot about it until now :) I made one minor fix
and resubmitted as v2. It is not crucial for the release but it would
be great to have it included of course. Also for you to decide how to
handle it.

Best regards,
Thomas
