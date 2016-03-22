From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 20:20:01 +0100
Subject: [Buildroot] [PATCH] erlang: bump to version 18.3
In-Reply-To: <1458668252-15146-1-git-send-email-fhunleth@troodon-software.com>
References: <1458668252-15146-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160322202001.0c45f084@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 13:37:32 -0400, Frank Hunleth wrote:
> Erlang/OTP 18.3 is a service release on the 18 track with mostly bug
> fixes, but is does contain a number of new features and improvements as
> well.
> 
> Some highlights of the release are:
> 
>   . New statistics info about runnable and active processes & ports.
>     Call erlang:statistics with: total_run_queue_lengths |
>     run_queue_lengths | total_active_tasks | active_tasks.
> 
>   . Time warp improvements: dbg:p/2 and erlang:trace/3 with
>     monotonic_timestamp |strict_monotonic_timestamp.
> 
>   . Introduced a validation callback for heart.
> 
>   . The module overload in sasl has been deprecated.
> 
>   . ~90 contributions since 18.2
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/erlang/erlang.hash | 4 ++--
>  package/erlang/erlang.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
