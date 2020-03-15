From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 22:05:32 +0100
Subject: [Buildroot] [PATCHv2 00/12] More perl packages + chartjs
In-Reply-To: <20200210112636.8155-1-patrickdepinguin@gmail.com>
References: <20200210112636.8155-1-patrickdepinguin@gmail.com>
Message-ID: <20200315220532.686b0eb4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Fran?ois in Cc.

On Mon, 10 Feb 2020 12:26:23 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> Joeri Barbarien (7):
>   package/perl-locale-maketext-lexicon: new package
>   package/perl-i18n: new package
>   package/perl-mojolicious-plugin-authorization: new package
>   package/perl-mojolicious-plugin-cspheader: new package
>   package/perl-mojolicious-plugin-i18n: new package
>   package/perl-mojolicious-plugin-securityheader: new package
>   package/chartjs: new package
> 
> Thomas De Schampheleire (5):
>   package/perl-mozilla-ca: new package
>   package/perl-lwp-protocol-https: new package
>   package/perl-path-class: new host package
>   package/perl-crypt-ssleay: new package
>   support/testing: add missing test file for perl-html-parser

Thanks, I've applied the entire series.

The only thing I have adjusted is that the new tests were missing
entries in the DEVELOPERS file. Fran?ois, perhaps this should be
improved in the scancpan script ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
