From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 22 Nov 2020 16:33:01 +0100
Subject: [Buildroot] [PATCH v1] package/wireless-regdb: bump version to
 2020.11.20
In-Reply-To: <87a6v9wjn7.fsf@dell.be.48ers.dk>
References: <20201120194130.20906-1-ps.report@gmx.net>
 <87a6v9wjn7.fsf@dell.be.48ers.dk>
Message-ID: <20201122163301.190f8b0b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sun, 22 Nov 2020 15:28:28 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> You didn't mark this for next. Is there a specific reason why this
> should be applied to master?
>

At your choice ;-) (I was too undecided if a up-to-date wireless-regdb is
important enough/accounts as bug fix or is stuff for next, but tending more
to the up-to-date case...)

Regards,
Peter


Short commit log taken from [1]:

wireless-regdb: update regulatory database based on preceding
wireless-regdb: Update regulatory rules for Kazakhstan (KZ)
wireless-regdb: update 5.8 GHz regulatory rule for GB	Seth Forshee
wireless-regdb: Update regulatory rules for Pakistan (PK) on 5GHz
wireless-regdb: Update regulatory rules for Croatia (HR)
wireless-regdb: restore channel 12 & 13 limitation in the US
wireless-regdb: update regulatory rules for Egypt (EG)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/log/
