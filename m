From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 16:25:21 +0200
Subject: [Buildroot] Splitting this list
In-Reply-To: <87ehlzonqi.fsf@macbook.be.48ers.dk>
References: <CAJpxd05FN2NVVaQ2CAMkpRDvazFiqhSAqBEOgd+=Yc9JrDbZgA@mail.gmail.com>
 <87ehlzonqi.fsf@macbook.be.48ers.dk>
Message-ID: <20120918162521.775f975f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 18 Sep 2012 08:21:09 +0200, Peter Korsgaard wrote:
> >>>>> "Bryce" == Bryce Schober <bryce.schober@gmail.com> writes:
> 
>  Bryce> It seems to me that this list could benefit from a split to
>  Bryce> buildroot-user & buildroot-dev. There's an awful lot of
>  Bryce> developer "noise" for those trying to get off the ground and get
>  Bryce> working. Just a thought...
> 
> We've considered it in the past, but so far the feeling among the main
> developers favors a single list.
> 
> Another proposal than -user / -dev was to move the git commit mails to a
> seperate list, which was brought up recently.
> 
> But splitting the list can also bring disadvantages, so I would prefer
> to keep it like it is, unless a lot of people think elsewise?

For a program such as Buildroot, there is really a continuum between
"user" and "developer": most users need at some point to become
developers, since to effectively use Buildroot you most likely need to
create packages for your own applications, create configurations for
your board, etc. Therefore, I don't think that splitting the
mailing-lists, and therefore splitting the communities is a good idea.

That said, if at some point the amount of traffic of the list starts to
discourage too many users from being on the list, we should probably
take action and do something. Maybe keep buildroot@ as it is, and
create a separate support at buildroot.org mailing list, only for user
support?

Regarding git commits, I definitely think they should remain on the
main developer mailing list. Having them encourages review, and allows
developers to remain aware of what's being merged.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
