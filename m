From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 2 Feb 2020 09:48:35 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/qt5base: add patches to fix
 CVE-2020-0569 and CVE-2020-0570 for latest
In-Reply-To: <87sgjuorlh.fsf@dell.be.48ers.dk>
References: <20200130211335.24913-1-ps.report@gmx.net>
 <20200130211335.24913-2-ps.report@gmx.net>
 <87sgjuorlh.fsf@dell.be.48ers.dk>
Message-ID: <20200202094835.0613f372@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sat, 01 Feb 2020 23:44:26 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > Add upstream patches to fix CVE-2020-0569 and CVE-2020-0570 for
>  > latest qt version (for details see [1]).
>
>  > [1] https://www.openwall.com/lists/oss-security/2020/01/30/1
>
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Committed after extending the commit message a bit, thanks.
>
> I see from the advisory that there is a 5.12.7 version with this fix
> included. Any specific reason why we don't bump the version instead?

Because the advisory states 'fixed 5.12.7 (future)'...

>
> https://download.qt.io/archive/qt/5.12/5.12.7/
>

...and the version is only available since two days (and the sha256 sums only since
yesterday)..., but version bump  patch will follow soon ;-)

Regards,
Peter
