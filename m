From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Sat, 13 Aug 2016 17:14:12 -0400
Subject: [Buildroot] Analysis of build results for 2016-08-09
In-Reply-To: <20160810161455.142a6a19@free-electrons.com>
References: <20160810063029.6F291102D04@stock.ovh.net>
 <20160810161455.142a6a19@free-electrons.com>
Message-ID: <87lh00z80r.fsf@ketchup.mtl.sfl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

>>     mips64el |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/c8a6001f437701ecc75f6c9252935645bda8a8c8/
>
> Not sure:
>
>   checking if system libevent works as expected... configure: error: *** unusable system libevent
>
> Vivien, you are the last person who bumped lldpd, so could you have a
> look?

I'm not sure to understand the error.

Given http://autobuild.buildroot.net/results/c8a/c8a6001f437701ecc75f6c9252935645bda8a8c8/
here's why I did:

    buildroot$ git checkout eef80855f1b4533467e04c8e776f1e2f826e5090
    buildroot$ curl http://autobuild.buildroot.net/results/c8a/c8a6001f437701ecc75f6c9252935645bda8a8c8/config > .config
    buildroot$ make lldpd

And this works. What am I doing wrong the reproduce the issue?

Thanks,

        Vivien
