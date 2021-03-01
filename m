From: Christian Stewart <christian@paral.in>
Date: Mon, 1 Mar 2021 04:00:59 -0800
Subject: [Buildroot] [PATCH v2 1/1] package/openssh: security bump to
 version 8.4p1
In-Reply-To: <20210301115903.10828-1-christian@paral.in>
References: <20210301115903.10828-1-christian@paral.in>
Message-ID: <CA+h8R2rA1BNzeNg7JstSvRRrzt3qq5wmk_XhyJYP94Yc-HRJ5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


On Mon, Mar 1, 2021 at 3:59 AM Christian Stewart <christian@paral.in> wrote:
>
> From: Baruch Siach <baruch@tkos.co.il>

...sigh... not sure why Git decided Baruch was the author of this one.

> Fixes CVE-2020-15778: scp in OpenSSH through 8.3p1 allows command injection in
> the scp.c toremote function, as demonstrated by backtick characters in the
> destination argument. NOTE: the vendor reportedly has stated that they
> intentionally omit validation of "anomalous argument transfers" because that
> could "stand a great chance of breaking existing workflows."
>
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-15778

This vulnerability still exists in openssh in Buildroot 2021.02-rc3.

Best regards,
Christian Stewart
