From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 11 Aug 2020 00:09:20 +0200
Subject: [Buildroot] SSHD issue between 2015 and 2020 versions
In-Reply-To: <CAN34foxnvLRtSV7GM_=PM6vHZyo6HmeXVCSrjDpyTpRNzK7nGQ@mail.gmail.com>
References: <CAN34foxnvLRtSV7GM_=PM6vHZyo6HmeXVCSrjDpyTpRNzK7nGQ@mail.gmail.com>
Message-ID: <20200811000920.18474f68@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephen,

On Mon, 10 Aug 2020 17:03:05 -0400, Stephen Beckwith <embeddedsteve@gmail.com> wrote:

> Please see the attached document that describes an issue that I've
> encountered when migrating from Buildroot 2015.08.1 to Buildroot 2020.02.
> At this point, I cannot include ssh/sshd for inclusion in the system, which
> is necessary.

Hard to determine what is causing your failure:

	mkusers: user 'sshd' already exists with group 'users' (wants 'sshd')

Does it happen with an simple build? Or with your re-started one?

Please provide a .config/defconfig file from your failing buildroot
configuration...

Regards,
Peter

>
> Any pointers/suggestions would be greatly appreciated.
>
> Regards,
> Stephen Beckwith
