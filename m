From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 25 Jul 2012 08:03:25 +0100
Subject: [Buildroot] [PATCH] gpsd: fix qt build problem
In-Reply-To: <20120725084743.1f624a9a@skate>
References: <1343161749-23289-1-git-send-email-spdawson@gmail.com>
 <20120724230041.29d9502f@skate>
 <CAHt8ZCP8C7qiaSR7OhdYHUoEK2uF7cLQ=WUraa-aqkzJvfpiBg@mail.gmail.com>
 <20120725084743.1f624a9a@skate>
Message-ID: <CAHt8ZCOxCT93BYZdVCWLeRWT53HitG0LgeKOz6bi5hJa9ZbMzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25 July 2012 07:47, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I wish I didn't had to do this horrible SED'ing of Qt .pc files after
> their installation, but unfortunately, the Qt build system handling of
> paths is non-standard and it's really not trivial to get something that
> builds, installs in the right place, and has the right prefix.

Sure. It might not be the prettiest of fixes, but it's still a good
find: no doubt this would have caused a problem sooner or later,
regardless of the gpsd issues.

Simon.
