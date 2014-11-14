From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Nov 2014 14:42:56 +0100
Subject: [Buildroot] [PATCH 02/10] dash: bump to 0.5.8-2
In-Reply-To: <87bno9hpfv.fsf@dell.be.48ers.dk>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-3-git-send-email-gustavo@zacarias.com.ar>
 <20141114141548.55205c95@free-electrons.com>
 <87bno9hpfv.fsf@dell.be.48ers.dk>
Message-ID: <20141114144256.7486638c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 14 Nov 2014 14:39:00 +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Dear Gustavo Zacarias,
>  > On Fri, 14 Nov 2014 09:44:48 -0300, Gustavo Zacarias wrote:
>  >> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>  >> ---
>  >> package/dash/dash.hash | 4 ++--
>  >> package/dash/dash.mk   | 4 ++--
>  >> 2 files changed, 4 insertions(+), 4 deletions(-)
> 
>  > Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
>  > Peter, this one should probably go in 2014.11.
> 
> Why? Is it security related? I don't see anything special in the
> changelog. In fact, I don't see anything affecting us at all:
> 
> http://metadata.ftp-master.debian.org/changelogs//main/d/dash/dash_0.5.8-2_changelog

I should have said: s/should/could/. I believe it's a minor update, and
it's adding hash files, so it's fine for 2014.11. But it's your call :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
