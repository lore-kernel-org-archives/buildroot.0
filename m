From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 08:29:34 +0100
Subject: [Buildroot] [PATCH 1/3] package/exiv2: annotate CVE-2019-13504
In-Reply-To: <CAPi7W83y6UpduPvecerrx0UPqaR0NwJVKvV3KH6fFhiT2Yvs8Q@mail.gmail.com>
References: <20200229213204.3703303-1-fontaine.fabrice@gmail.com>
 <20200229222154.GX8743@scaer>
 <CAPi7W83y6UpduPvecerrx0UPqaR0NwJVKvV3KH6fFhiT2Yvs8Q@mail.gmail.com>
Message-ID: <20200301072934.GY8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-29 23:28 +0100, Fabrice Fontaine spake thusly:
> Le sam. 29 f?vr. 2020 ? 23:21, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
> > On 2020-02-29 22:32 +0100, Fabrice Fontaine spake thusly:
> > > CVE-2019-13504 is misclassified (by our CVE tracker) as affecting
> > > version 0.27.2, while in fact both commits that fixed this issue are
> > > already in this version.
[--SNIP--]
> > However, for patch 1, I have been able to track only one commit, but you
> > noted two. It would be nice if youc ould provide the sha1 for those two
> > commits.
> Sure, here it is (from
> https://security-tracker.debian.org/tracker/CVE-2019-13504):
> - https://github.com/Exiv2/exiv2/commit/bd0afe0390439b2c424d881c8c6eb0c5624e31d9
> - https://github.com/Exiv2/exiv2/commit/54f0bebca032d0286a0e48f47e67dfc6141fedff

Applied to master with those references added to the commit log. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
