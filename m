From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 29 Dec 2018 23:46:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-12-28
In-Reply-To: <20181229070031.506F02073D@mail.bootlin.com>
References: <20181229070031.506F02073D@mail.bootlin.com>
Message-ID: <87o994vweq.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thomas Petazzoni writes:
>         m68k |                    whois-5.3.2 | NOK | http://autobuild.buildroot.net/results/c139030e8383027dc679cfc59feddad426919900 |

This is a transient issue with the snapshot.debian.org server. However,
the sources.buildroot.net fallback doesn't work either:

--2018-12-27 19:51:56--  http://sources.buildroot.net/whois/whois_5.3.2.tar.xz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.25.211.19, 104.25.210.19, 2606:4700:20::6819:d213, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.25.211.19|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-12-27 19:51:56 ERROR 404: Not Found.

And indeed the whois tarball is not there even though version 5.3.2 is
in Buildroot since July, and is included in the 2018.11 release. What
went wrong?

Thanks,
baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
