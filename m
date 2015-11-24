From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Tue, 24 Nov 2015 14:14:47 -0300
Subject: [Buildroot] [PATCH] minizip: new package
In-Reply-To: <5654752E.1040009@imgtec.com>
References: <1448316362-19184-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <5654752E.1040009@imgtec.com>
Message-ID: <56549B07.9060900@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/11/15 11:33, Vicente Olivert Riera wrote:

>> +config BR2_PACKAGE_MINIZIP_DEMOS
>> +	bool "miniunzip/minizip"
>
> Personally I would write something more obvious like "Install tools".

Hi.
Well, "install tools" doesn't say much, saying what's installed if it 
fits is much more useful.
Besides these aren't tools, they're demos, that's why the config symbol 
is called so.
For a fully-fledged zip/unzip implementation infozip fits the bill more 
nicely, if you want a lib then this is it.
The rest addressed in v2.
Regards.
