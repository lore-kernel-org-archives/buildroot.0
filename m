From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 13:26:45 +0100
Subject: [Buildroot] [POC] buildroot packages site
In-Reply-To: <CAEyMn7brT6fMrUmb7L61ofOx7NuEKj2OqZrL9X00gp4rYZp1RQ@mail.gmail.com>
References: <CAEyMn7brT6fMrUmb7L61ofOx7NuEKj2OqZrL9X00gp4rYZp1RQ@mail.gmail.com>
Message-ID: <20200103132645.6be5a250@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

On Fri, 3 Jan 2020 11:48:53 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> I invested some spare time to create a buildroot packages/stats site.
> I used python-flask for processing the json output of the pkg-stats
> script. To have more information in the output file I did some
> modifications on the pkg-stats script as well.
> 
> A running installation as fcgi is available here:
> http://packages.buildroot.thiery.it

Wow, that's really nice. We definitely want to deploy this as a
replacement to http://autobuild.buildroot.org/stats/. Perhaps we should
even promote this to http://stats.buildroot.org/ or something like that.

One question: how did you collect the stats history at
http://packages.buildroot.thiery.it/packages/stats?commit=198bdaadd03f75fe959c21089c354d36c90069bc ?

Thanks for this development, looks very promising!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
