From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Nov 2014 10:59:12 -0300
Subject: [Buildroot] [PATCH 02/10] dash: bump to 0.5.8-2
In-Reply-To: <87389lhoyb.fsf@dell.be.48ers.dk>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>	<1415969096-3032-3-git-send-email-gustavo@zacarias.com.ar>	<20141114141548.55205c95@free-electrons.com>	<87bno9hpfv.fsf@dell.be.48ers.dk>	<20141114144256.7486638c@free-electrons.com>
 <87389lhoyb.fsf@dell.be.48ers.dk>
Message-ID: <54660AB0.6050905@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/14/2014 10:49 AM, Peter Korsgaard wrote:

> Ok. It only updates the .hash, we already have it for -1.
> 
> Gustavoz, what is the reason for the bump? According to the changelog
> the only difference is in the debian packaging (should we also pass
> --disable-lineno?)

Many tiny fixes, it's not only that.
I think we could consider it a security fix even if there's no
know/public vulnerability yet:
https://cygwin.com/ml/cygwin-announce/2014-09/msg00043.html

Regards.
