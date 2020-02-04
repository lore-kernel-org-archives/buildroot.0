From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 4 Feb 2020 13:09:25 -0800
Subject: [Buildroot] [PATCH] package/xen: bump to version 4.13.0
In-Reply-To: <87zhdyn0hx.fsf@dell.be.48ers.dk>
References: <20200203224241.12481-1-alistair.francis@wdc.com>
 <87zhdyn0hx.fsf@dell.be.48ers.dk>
Message-ID: <CAKmqyKMNyJubtuOa=tS8KidYbpvQFmJYA7CSV1x+N+emGDQ6BA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 4, 2020 at 1:51 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Alistair" == Alistair Francis <alistair.francis@wdc.com> writes:
>
>  > Bump to the latest version of Xen and remove the no longer required
>  > patch.
>
>  > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> Committed, thanks.
>
> I see from the release notes
> (https://wiki.xenproject.org/wiki/Xen_Project_4.13_Release_Notes) that
> it should now work with python 3.x. Given that python 2.x is now EOL, it
> would be good if we could change it to use host-python3 instead.
>
> Is this something you can look into?

I just sent a patch.


Alistair

>
> --
> Bye, Peter Korsgaard
