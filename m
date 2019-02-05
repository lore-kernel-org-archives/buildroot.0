From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 5 Feb 2019 15:28:06 +0100
Subject: [Buildroot] [PATCH] package/mender: fixing init script naming
In-Reply-To: <8736p2nwfx.fsf@dell.be.48ers.dk>
References: <1549376201-16547-1-git-send-email-angelo@amarulasolutions.com>
 <8736p2nwfx.fsf@dell.be.48ers.dk>
Message-ID: <CA+_SqVaWv_DetkC=S8FUR1mBucPs0VaUxpw-CiBd8pS3zHStRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 5, 2019 at 3:26 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>
>  > The installed systemv script should be name S42mender and not S04mender.
>
> You forgot to explain _WHY_, E.G. that mender needs the network to be up
> before it starts (presumably?)

It's simply a bug, the init script is already named that way!

>
> --
> Bye, Peter Korsgaard
