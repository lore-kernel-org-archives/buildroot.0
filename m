From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Tue, 20 Jun 2017 20:19:23 +0530
Subject: [Buildroot] [PATCH 0/3] core: check hashes of license files
In-Reply-To: <20170619174707.GB3045@scaer>
References: <cover.1497772831.git.yann.morin.1998@free.fr>
 <CA+NV+Vmd+uwWztf4Po71Kh3WHPVzPR++HSUdmBoF1oddsS14ew@mail.gmail.com>
 <20170619174707.GB3045@scaer>
Message-ID: <CA+NV+Vnf6EkFtjYOW5cjNZeO-srqdVbgNbBJnGSZAbVeuWY0Zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 19, 2017 at 11:17 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Rahul, All,
>
> It is not possible to do at download time. It can only be done after
> the package has been extracted and patched.

I mean after after download is complete and before we build package.

> That is why, when you run legal-info on a non-built (but configured)
> tree, you'll notice that Buildroot extracts and patches the packages
> before saving their legal-info.
>
> Besides, if one uses the support/scripts/test-pkg script to test the
> version bump, then legal-info is run by the script.
>
> So, I still believe it is better done during legal-info.

Yes, during legal-info looks more logical and as test-pkg script runs
legal-info that should be fine.

Thanks,
Rahul
