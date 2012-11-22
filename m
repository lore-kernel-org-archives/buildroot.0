From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 11:46:33 +0100
Subject: [Buildroot] [PATCH 03/33] tcpdump: use 'pkg-config pcap'
 instead of pcap-config
In-Reply-To: <20121122111041.73d397ee@skate>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-4-git-send-email-s.martin49@gmail.com>
 <20121122111041.73d397ee@skate>
Message-ID: <CAHXCMMLtuvExfmB4FBSu1L13eMu7Guy_PJt4oSfODTVJkcNwXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2012/11/22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Thu, 22 Nov 2012 01:17:53 +0100, Samuel Martin wrote:
>
>> +-        AC_PATH_TOOL(PCAP_CONFIG, pcap-config)
>> ++        AC_PATH_TOOL(PCAP_CONFIG, pkg-config)
>
> This is not generally how pkg-config is used. In general, people use
> the PKG_CHECK_MODULES() autoconf macro.
>
> Has this been pushed upstream?
I've not tried to push this patch upstream yet.

> I guess you need to make it smarter
> like: start testing with pkg-config, then fallback to pcap-config, in
> order to make this suitable for upstream.
I agree.
The truth is I'm not so confident with autotools, so any enlightment is welcome.


Regards,


-- 
Sam
