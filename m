From: Alex Bradbury <asb@asbradbury.org>
Date: Thu, 2 Aug 2012 15:19:15 +0100
Subject: [Buildroot] Package informations, online and updated
In-Reply-To: <20120731213729.49c4b3ee@skate>
References: <20120731213729.49c4b3ee@skate>
Message-ID: <CA+wH296kBL8ZhhrHW7KCdrvFRuhB3-B=H2yJwZTyu75A8FhJyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31 July 2012 20:37, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> There are probably more metrics to add, even small things like presence
> of ':=' operators. Don't hesitate to share your ideas and patches about
> this.

It would be handy to add the current version for each package. More
ambitiously, a variable defining a watch[1] line could be added to
each Makefile, and used with the Debian scripts (such as uscan) to
automatically detect new upstream versions.

[1]: http://wiki.debian.org/debian/watch/

Alex
