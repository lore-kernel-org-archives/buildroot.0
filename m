From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Aug 2017 11:56:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-08-10
In-Reply-To: <k9s06ex8uo.ln2@ID-313208.user.individual.net>
References: <20170811063103.6730E20A51@mail.free-electrons.com>
 <k9s06ex8uo.ln2@ID-313208.user.individual.net>
Message-ID: <20170812095614.GA3021@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-08-11 16:41 +0200, Bernd Kuhls spake thusly:
> Am Fri, 11 Aug 2017 08:31:03 +0200 schrieb Thomas Petazzoni:
> 
> >          | ORPH arm |            oracle-mysql-5.1.73 | NOK |
> >          http://autobuild.buildroot.net/
> results/49377c636edf72bc68cbcecd1a787d578dba1d4e
> 
> FYI: this build error, although still valid, was found by your 
> autobuilder http://autobuild.buildroot.net/?submitter=Yann+E.+MORIN
> which is not testing current git master, but git master as of Jul, 29th

In fact, we identified with Thomas that the build was correctly done on
master, but the gitid is wrong only in the report.

It turned out to be a bug in a recent commit in the autobuild script,
which caused the wrong commit ID to be reported.

And in fact, all autobuilder instances that were up to date were
suffering from the issue. Only those that did not update their instances
were sending the correct gitid.

I've sent a patch, with more details in there.

Thanks! for the report! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
