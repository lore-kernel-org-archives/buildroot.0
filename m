From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Apr 2020 18:59:51 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add option to define custom
 dependencies
In-Reply-To: <20200427174108.6f7f8e86@windsurf.home>
References: <20200425000629.2068191-1-heiko@sntech.de>
 <20200425153810.2e86813e@windsurf.home> <20200425211350.GR5035@scaer>
 <44894d6d-ed79-9221-2838-5ce6971cb848@mind.be>
 <20200427174108.6f7f8e86@windsurf.home>
Message-ID: <bd6aea3f-408b-a1b2-5d54-89da4db5f4ae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/04/2020 17:41, Thomas Petazzoni wrote:
> Thanks. Should I nevertheless introduce the PYLIBFDT_PYTHON3 and
> PYELFTOOLS_PYTHON3 options, in addition to this ? Or do we for these
> new use cases favor using only the CUSTOM_DEPENDENCIES solution ?

 Given how controversial this new option is, I guess it's better to add the
-python3 options.

 The name of the options is a bit awkward, because the package is
host-python3-pylibfdt, not pylibfdt-python3...

 Regards,
 Arnout
