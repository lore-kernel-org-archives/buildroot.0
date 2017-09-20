From: Christian Stewart <christian@paral.in>
Date: Wed, 20 Sep 2017 11:32:40 +0100
Subject: [Buildroot] [PATCH 2/9] tini: new package
In-Reply-To: <20170920044024.hw3gktuy622jtlec@tarshish>
References: <20170920030210.19446-1-christian@paral.in>
 <20170920030210.19446-3-christian@paral.in>
 <20170920044024.hw3gktuy622jtlec@tarshish>
Message-ID: <CA+h8R2pyK7=e5ivd7yAzPFkT-BebOm+FCsjKHi99GEU9=_k-6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Wed, Sep 20, 2017 at 5:40 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Any reason not to package the latest 0.16.1 version?


I can change this, the only reason was because I have not updated
these packages since writing them some months ago when they were
originally pushed to Buildroot.

> > +TINI_SITE = https://github.com/krallin/tini/archive

I'm surprised you didn't notice that I forgot to use the GitHub macro here :)

Updated patch series is here:

 - https://github.com/paralin/buildroot/tree/bump-docker-go

I will respin after some days if there are no comments on the other patches.

Best,
Christian
