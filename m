From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 16:57:33 +0100
Subject: [Buildroot] [RFC] Relocatable host tools
In-Reply-To: <CAAXf6LWo1kud7n4pxUcd+yuU7Pz-BpaDF+ipv3Mwh4dZmjgvEA@mail.gmail.com>
References: <CAAXf6LX2uJ7p+SzdZq2LKL0JsHXB0PzO_1Lx5tTjcBfDq-7wZg@mail.gmail.com>
 <20151211162850.327b9e71@free-electrons.com>
 <CAAXf6LWo1kud7n4pxUcd+yuU7Pz-BpaDF+ipv3Mwh4dZmjgvEA@mail.gmail.com>
Message-ID: <20151211165733.158cd59b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, 11 Dec 2015 16:55:09 +0100, Thomas De Schampheleire wrote:

> Ah, clearly not! Thanks for the reference.
> (I did search in my gmail, but had deleted old mails a while back)
> 
> Are there blocking issues with these patches? There are still some
> open comments on v5 but no objections in that iteration.
> (I haven't reviewed the code myself yet).
> 
> Samuel, could you also share your view on the status of these patches?
> Are you planning a new iteration with Baruch's comments fixed?

My objection is that the host rpath checks is done in shell scripts,
and the target rpath mungling in python scripts. I'd like to use either
one or the other language, but not both.

I believe Samuel said he wanted to respin his series, to use python
scripts to also do the host rpath checks that were added by Yann.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
