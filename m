From: Arguin, Christopher P     UTAS <Christopher.Arguin@utas.utc.com>
Date: Fri, 22 Jul 2016 00:16:42 +0000
Subject: [Buildroot] [External] Re: Issues with cross-compiling from
 x86_64 to a different x86_64
In-Reply-To: <7df6b0fbaba9ff12fc4d1b36fb7d8fea@smile.fr>
References: <34C69F44FE4EA4498813EAECDBF40C1623A46E39@GUSALE0B.na.utcmail.com>
 <20160720000154.4132543d@free-electrons.com>
 <34C69F44FE4EA4498813EAECDBF40C1623A47405@GUSALE0B.na.utcmail.com>
 <20160720220258.46331635@free-electrons.com>
 <34C69F44FE4EA4498813EAECDBF40C1623A483E0@GUSALE0B.na.utcmail.com>
 <20160721092222.07ad1f9b@free-electrons.com>
 <7df6b0fbaba9ff12fc4d1b36fb7d8fea@smile.fr>
Message-ID: <34C69F44FE4EA4498813EAECDBF40C1623A4978F@GUSALE0B.na.utcmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas and Romain,

>>> ncftp, but not the use of the host-tool. I managed to have just the 
>>> right setup
>> ty obscure corner case.
>> 
>> Indeed. Will you submit a patch for --disable-ccdv ?
>
> I reproduced the issue here and indeed --disable-ccdv fix the build.

I've got a patch ready to submit, but I have to jump through some corporate hoops to release it. I know it's a trivial one-liner with that barely qualifies as code... but there you are.

So it'll be along in a little while...

Thanks,
Chris
