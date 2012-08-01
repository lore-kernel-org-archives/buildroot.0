From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 1 Aug 2012 20:55:51 +0200
Subject: [Buildroot] Package informations, online and updated
In-Reply-To: <20120731213729.49c4b3ee@skate>
References: <20120731213729.49c4b3ee@skate>
Message-ID: <CAAXf6LXtZ4Cp4-rpreKiuEdntpyJMeiyrWSNB93LOzbFDrt5Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Jul 31, 2012 at 9:37 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> After the update to the pkg-stats package, I've set up the necessary
> infrastructure to keep an updated online result of this script. It can
> be seen at any time at:
>
>  http://autobuild.buildroot.org/stats/
>
> I will run the script every day in a crontab, after doing a git pull,
> so it will reflect the daily status of our packages.
>
> There are probably more metrics to add, even small things like presence
> of ':=' operators. Don't hesitate to share your ideas and patches about
> this.

Nice!
In fact, I wasn't aware of the pkg-stats script at all. I doesn't seem
to be mentioned in the documentation, or has this changed in recent
versions?

Anyway, good idea to put it online.

Best regards,
Thomas
