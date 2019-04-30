From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 30 Apr 2019 11:13:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/bind: fix python build
In-Reply-To: <87bm0nq5fp.fsf@dell.be.48ers.dk>
References: <20190427134925.1730-1-fontaine.fabrice@gmail.com>
 <87ftq0ot5n.fsf@dell.be.48ers.dk>
 <CAPi7W83NrB4bdbc-zbhCrP7SY0VgJpxiAxGOpfvnEcCbiRh7Fg@mail.gmail.com>
 <87bm0nq5fp.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W832BcnGcC+gzV13gZc75btrhzUSXMRQquia8zLV=qOyuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le mar. 30 avr. 2019 ? 10:10, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
> Hi,
>
>  >> If I understand it right, we need ply for the host to satisfy the
>  >> configure check and ply for the target for runtime, so I guess the
>  >> solution is to add a host version of the python-ply package.
>
>  > Yes, I forgot to add the host variant of python-ply.
>
> Will you send a patch to fix it?
Yes, I'll do it this evening.
>
> --
> Bye, Peter Korsgaard
Fabrice
