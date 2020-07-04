From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jul 2020 10:34:46 +0200
Subject: [Buildroot] Missing autobuild daily reports
In-Reply-To: <87sgea6tp1.fsf@tarshish>
References: <87sgea6tp1.fsf@tarshish>
Message-ID: <20200704103446.6c9215f4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 02 Jul 2020 14:29:46 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> The last autobuild report was sent on June 26:
> 
>   http://lists.busybox.net/pipermail/buildroot/2020-June/285725.html
> 
> I find these daily reports useful.

I had a look: I updated my server on June 27 to a newer Ubuntu version,
and the _mysql Python module that the script is using is no longer
available. I haven't immediately seen if _mysql was still available in
some other package, so I'll probably have to adjust the code to use
another MySQL Python module.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
