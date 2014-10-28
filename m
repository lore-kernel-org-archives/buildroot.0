From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 28 Oct 2014 12:16:52 +0100
Subject: [Buildroot] [RFC] Responsive Design Website
In-Reply-To: <CA+TH9VmP76wiQFJgn4i+f6b_oO7uQc2Duoswz+H5vrj=F0AOTA@mail.gmail.com>
References: <CA+TH9VmP76wiQFJgn4i+f6b_oO7uQc2Duoswz+H5vrj=F0AOTA@mail.gmail.com>
Message-ID: <CAAXf6LXnt=MEKpTLVUx4SmuJOHStdMQ-gsKQHax0me=x8obwxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

On Mon, Oct 27, 2014 at 10:56 PM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> Hello List!
>
> As a sign of gratitude for my recently committed mono patches, I
> thought having a responsive design website could be a nice addition to
> Buildroot.
>
> With this in mind, I updated to the latest bootstrap3 and jquery
> versions, fixed various unbootstrapness everywhere and made the
> website responsive!
>
> The website is very similar to the old one, the most difficult task
> was to clean it to let conditional css rules make their job.
>
> You can try it (also with your mobile phone) at:
>
> http://buildrootrd.idea-on-line.it/ (WARNING: dns is stil propagating)
>
> I'm open to suggestions and if you like the work I'll continue to fix
> the entire website and I'll send a patch in the next few days.

Many thanks for this work, this is very much appreciated!
This has been (somewhere) on my TODO list for a long time, and I'm
glad you picked it up.

Some comments:

- the 'Buildroot' button top-left should link to the home page,
currently it links to #.
- for some reason, the website does not support zooming on Android
with Dolphin Browser. I haven't checked other browsers. Is this
expected?
- on a desktop, the Sponsors page does not look the same way as the
original. (Firefox 29 on Linux)

Best regards,
Thomas
