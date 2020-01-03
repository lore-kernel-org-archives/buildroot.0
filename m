From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 15:46:35 +0100
Subject: [Buildroot] [POC] buildroot packages site
In-Reply-To: <CAEyMn7brT6fMrUmb7L61ofOx7NuEKj2OqZrL9X00gp4rYZp1RQ@mail.gmail.com>
References: <CAEyMn7brT6fMrUmb7L61ofOx7NuEKj2OqZrL9X00gp4rYZp1RQ@mail.gmail.com>
Message-ID: <20200103154635.4508807e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Jan 2020 11:48:53 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> I invested some spare time to create a buildroot packages/stats site.
> I used python-flask for processing the json output of the pkg-stats
> script. To have more information in the output file I did some
> modifications on the pkg-stats script as well.
> 
> A running installation as fcgi is available here:
> http://packages.buildroot.thiery.it
> 
> The current sources of the implementation is available under:
> https://github.com/hthiery/buildroot-stats
> https://github.com/hthiery/buildroot/tree/feature-pkg-stats

Perhaps on the per-developer page, such as
http://packages.buildroot.thiery.it/packages/developer/Thomas%20Petazzoni%20%3Cthomas.petazzoni%40bootlin.com%3E
it would make sense to sort the list alphabetically by package name, at
least by default.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
