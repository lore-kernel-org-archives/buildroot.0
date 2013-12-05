From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Dec 2013 00:41:22 +0100
Subject: [Buildroot] Availability of old build results
In-Reply-To: <20131206002526.58d095e8@skate>
References: <20131206002526.58d095e8@skate>
Message-ID: <20131205234122.GH3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-06 00:25 +0100, Thomas Petazzoni spake thusly:
> Due to the autobuild.buildroot.org server crash, I had to quickly set
> up a new instance, which didn't include the build results available
> from the old server.
> 
> I'm happy to announce that I have now reimported the old build results
> in the new server. This means that:
> 
>  1/ All previous autobuild.buildroot.org URLs of build results should
>     now work again.
> 
>  2/ The graph of success vs. failure rate is a lot more useful, see
>     http://autobuild.buildroot.org/stats.php.

There is something striking about this graph: the month before releases,
we clearly see a trend that the ratio success/failure increases in
favour of sucess, and suddenly there is a dramatic reversal the moment
the release is made, ie. when next is merged back into master.

That means we're doing quite a good job at hunting the failures during
the feature-freeze: this cycle, the ratio was ~90% success / ~10% failures
at the time of release. This is pretty good. :-)

As for the sudden drop at the time next is merged, I don't know what to
think of it.

There are occasional spikes where the tendency goes toward failures, but
those are quickly fixed.

It would be nice if the X-axis was labelled with Sundays rather than
every 11 days. It looks like there is a 7-day period in the cycle of
success - failure-spikes.

Thanks for providing this data! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
