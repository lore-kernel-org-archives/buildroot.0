From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 14 Feb 2021 10:46:06 +0100
Subject: [Buildroot] [PATCH/next v1 7/7] package/dnsmasq: bump version
 to 2.84
In-Reply-To: <87blcnccb6.fsf@dell.be.48ers.dk>
References: <20210210231640.5262-1-ps.report@gmx.net>
 <20210210231640.5262-7-ps.report@gmx.net>
 <87blcnccb6.fsf@dell.be.48ers.dk>
Message-ID: <20210214104606.2130a854@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Feb 2021 08:56:29 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Looking at the release announcement, this is purely a bugfix fixing a
> regression in the 2.83 security fix release, so it should go to master
> (and 2020.02.x / 2020.11.x) and not next!
>
> Did you not look at the release announcement?
>
> http://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2021q1/014640.html

Sorry no, did do the update as part of the libubox/ubus (and dependencies)
update series and only take a look at this [1] changelog file (still stuck
on 2.83)...., thanks for noticing and fixing...

Regards,
Peter


[1] http://thekelleys.org.uk/dnsmasq/CHANGELOG

>
> I'll commit it to master now.
>
