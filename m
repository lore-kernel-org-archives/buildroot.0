From: Steven Noonan <steven@uplinklabs.net>
Date: Tue, 21 Apr 2015 16:58:02 -0700
Subject: [Buildroot] Reminder about your pending Buildroot patches
In-Reply-To: <20150421125634.385A788D@mail.free-electrons.com>
References: <20150421125634.385A788D@mail.free-electrons.com>
Message-ID: <CAKbGBLgnq72kw570gNB=EHFnw9UOJY3_7H0nFpebjJ9kgGx+qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 21, 2015 at 5:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is a reminder about your Buildroot patches that are older than 30
> days.
>
> We need your help to know if your patches are still relevant or not.
> To help us, make sure to update the status of your patches in
> patchwork as appropriate, or to resend an updated version that applies
> on the latest Buildroot master. Especially let us know if you would
> like to withdraw your patch if you are no longer interested.
>
> Here is the list of patches you have submitted that are still pending:
>
>  - [1/7] package/perf: if slang is enabled, depend on it
>    http://patchwork.ozlabs.org/patch/451638/
>
>  - [2/7] package/perf: if numactl (libnuma) is enabled, depend on it
>    http://patchwork.ozlabs.org/patch/451636/
>
>  - [3/7] package/perf: if libunwind is enabled, depend on it
>    http://patchwork.ozlabs.org/patch/451637/
>
>  - [5/7] package/perf: patch installation paths
>    http://patchwork.ozlabs.org/patch/451641/
>
>  - [6/7] package/perf: add patch to prevent crash on empty history buffer
>    http://patchwork.ozlabs.org/patch/451634/
>
>  - [7/7] package/perf: use correct definition of ARCH on x86_64
>    http://patchwork.ozlabs.org/patch/451633/

All 7 are still relevant.

>  - implement granular choice for stack protector
>    http://patchwork.ozlabs.org/patch/451643/

Still relevant.

>  - package/glibc: enable lock elision on x86_64 hosts
>    http://patchwork.ozlabs.org/patch/451651/

Still relevant.

>  - package: add shadow 4.2.1
>    http://patchwork.ozlabs.org/patch/451723/

There was some followup discussion which I haven't addressed. But it
is still relevant.

>  - package: add mosh 1.2.4
>    http://patchwork.ozlabs.org/patch/451726/

Still relevant.

>  - [v2] package/perf: build outside kernel tree
>    http://patchwork.ozlabs.org/patch/451947/

Relevant but people didn't want this one -- I just didn't see an
alternative if we were going to apply any patches to perf.

>  - package/libpthsem: correctly handle --{en, dis}able-debug arguments on configure
>    http://patchwork.ozlabs.org/patch/452271/

Still relevant.

> We have a lot of pending patches:
>    https://patchwork.ozlabs.org/project/buildroot/list/
>
> You can help shorten this list by reviewing and testing patches, which
> helps the maintainers when applying patches. The more patches are
> reviewed or tested patches, the more are applied; the more are
> applied, the shorter the list; the shorter the list, the faster
> patches are applied.
>
> Thanks a lot for your help and contribution to Buildroot!
> --
> Buildroot, http://buildroot.org
