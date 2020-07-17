From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Fri, 17 Jul 2020 15:01:26 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-07-12
In-Reply-To: <5f0c105a.1c69fb81.17d79.8de3SMTPIN_ADDED_MISSING@mx.google.com>
References: <5f0c105a.1c69fb81.17d79.8de3SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CAJe0E3fag3pVOjp+4ZHTq8mpVB7Ni18k0jrM_Bz_huxKa3QP3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

Packages with CVEs
> ==================
>
> This is the list of packages for which a known CVE is affecting them,
> which means a security vulnerability exists for those packages.
>
>              name              |       CVE        |
>      link
>
> -------------------------------+------------------+--------------------------------------------------------------
>                        libnids | CVE-2010-0751    |
> https://security-tracker.debian.org/tracker/CVE-2010-0751
>

What are your views about this problem?

Indeed I am using this lib to be able to (cross)compile 'dsniff' library,
but I did not want to introduce 'dsniff' to buildroot.
Do you consider this a problem, knowing that only one package requires this
lib & it is currently not integrated to Buildroot and, in my opinion,
should remain as is,

thanks

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le lun. 13 juil. 2020 ? 09:42, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> Hello,
>
> Packages with CVEs
> ==================
>
> This is the list of packages for which a known CVE is affecting them,
> which means a security vulnerability exists for those packages.
>
>              name              |       CVE        |
>      link
>
> -------------------------------+------------------+--------------------------------------------------------------
>                        libnids | CVE-2010-0751    |
> https://security-tracker.debian.org/tracker/CVE-2010-0751
>
> --
> http://autobuild.buildroot.net
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200717/1de16067/attachment.html>
