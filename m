From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jun 2016 14:19:52 +0200
Subject: [Buildroot] [PATCH 2/5] python-serial: bump to version 3.1
In-Reply-To: <CAGm1_kv5wjk7bceVM785UpAJSFAMcw_XEeur+QWh6+CHhXZq0w@mail.gmail.com>
References: <1464876330-6890-1-git-send-email-yegorslists@googlemail.com>
 <1464876330-6890-2-git-send-email-yegorslists@googlemail.com>
 <20160603193823.509e6ab3@free-electrons.com>
 <CAGm1_kv5wjk7bceVM785UpAJSFAMcw_XEeur+QWh6+CHhXZq0w@mail.gmail.com>
Message-ID: <20160604141952.42cbe9e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Jun 2016 22:21:42 +0200, Yegor Yefremov wrote:

> Seems to be Python 2 related. I've submitted a bug:
> https://github.com/pyserial/pyserial/issues/123
> Will keep an eye on it.

Seems like the developer replied that python-serial is Python 3 only.
So the dependency should be adjust in Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
