From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Feb 2019 20:15:52 +0100
Subject: [Buildroot] [PATCHv3 7/7] support/download/{bzr, cvs, git,
 svn}: highlight unimplemented source-check
In-Reply-To: <20190209221337.GJ3079@scaer>
References: <20190209202350.4984-1-patrickdepinguin@gmail.com>
 <20190209202350.4984-7-patrickdepinguin@gmail.com>
 <20190209221337.GJ3079@scaer>
Message-ID: <CAAXf6LVTKiHnhMOnMnMQmKup4-XMPN9LDfr_yFYE1fxxphUksQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El s?b., 9 feb. 2019 a las 23:13, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2019-02-09 21:23 +0100, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > For bzr, cvs, git and svn, there is no method of checking whether the
>
> Acutally, for svn this is realtively trivial:
>
>     svn ls -r ${rev} ${remote}
>
> We have two packages in Buildroot that use svn, fis and open2300, so you
> cn use them to test:
>
>     $ svn ls -r 2892 http://svn.chezphil.org/utils/trunk
>     Redirecting to URL 'https://svn.chezphil.org/utils/trunk':
>     Makefile
>     apexctl.cc
>     [...]
>

Thanks a lot, will double-check at my end and adapt.

/Thomas
