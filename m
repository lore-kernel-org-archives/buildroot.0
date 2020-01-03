From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 3 Jan 2020 11:59:06 +0100
Subject: [Buildroot] [POC] buildroot packages site
In-Reply-To: <CAEyMn7brT6fMrUmb7L61ofOx7NuEKj2OqZrL9X00gp4rYZp1RQ@mail.gmail.com>
References: <CAEyMn7brT6fMrUmb7L61ofOx7NuEKj2OqZrL9X00gp4rYZp1RQ@mail.gmail.com>
Message-ID: <9d2c5ba5-c326-e5e6-07bb-8ee4351ba82d@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko,

On 1/3/20 11:48 AM, Heiko Thiery wrote:
> Hi All,
> 
> I invested some spare time to create a buildroot packages/stats site.
> I used python-flask for processing the json output of the pkg-stats
> script. To have more information in the output file I did some
> modifications on the pkg-stats script as well.
> 
> A running installation as fcgi is available here:
> http://packages.buildroot.thiery.it

Wow! This is very useful!
If I try to filter for developers it doesn't show Developers Column, it 
only shows this on top:
1118 packages with error in developers

But I think it could be useful having a row with ORPHANED(y/n), what 
about it?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> The current sources of the implementation is available under:
> https://github.com/hthiery/buildroot-stats
> https://github.com/hthiery/buildroot/tree/feature-pkg-stats
> 
> Note that this is just a proof of concept with a lot of flaws ... ;-)
> Maybe it is possible for you to take a look on it and you can give me
> some feedback.
> 
> BR
> --
> Heiko
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
