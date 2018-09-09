From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Sep 2018 12:20:28 +0200
Subject: [Buildroot] [PATCH 1/1] mongoose: fix hash
In-Reply-To: <20180907091210.6ad78022@windsurf.home>
References: <20180906214220.854-1-fontaine.fabrice@gmail.com>
 <87musu3rpi.fsf@tkos.co.il> <20180907091210.6ad78022@windsurf.home>
Message-ID: <20180909102028.GF2841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, Thomas, All,

On 2018-09-07 09:12 +0200, Thomas Petazzoni spake thusly:
> On Fri, 07 Sep 2018 06:35:21 +0300, Baruch Siach wrote:
> > But the current github download is indeed different. Not sure what went
> > wrong here, but this description is not correct.
> I saw Yann and Peter talking about github tarballs having changed again:
> 
> 18:29 < Jacmet> hmm, looks like github tarballs again changed content :/
> 18:29 < Jacmet> http://autobuild.buildroot.net/results/599/599920bc0a5821fd3fb0a028574a25a22e12430f/build-end.log
> 18:42 < y_morin> Jacmet: At the same time, the fallback to s.b.o timeout, so maybe it is not a github issue either?
> 18:43 < Jacmet> y_morin: well, it did get a tarball from github and the hash didn't match
> 18:43 < y_morin> Jacmet: Arg, indeed. I even had another sha256 than the one in the report.
> 18:44 < Jacmet> y_morin: and downloading it from github here I also get the same (wrong) hash

That does not happen for all archives, though... :-/

And I can see that indeed the generated tarball is different from the
one on s.b.o.: it slightly differ in the way directory entries are
stored... Except for that, the actual content is the same.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
