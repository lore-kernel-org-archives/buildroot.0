From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Wed, 21 Aug 2013 08:28:59 +0300
Subject: [Buildroot] [RFC] Unification of package comments on wchar,
 largefile, c++ support, thread, ... support
In-Reply-To: <CAAXf6LV7wB6_RsufRWD6s7-viuYheasMHJWqDAGtu6BmPpZBdw@mail.gmail.com>
References: <CAAXf6LV7wB6_RsufRWD6s7-viuYheasMHJWqDAGtu6BmPpZBdw@mail.gmail.com>
Message-ID: <CAAHaz6E16CcRV1gpvFA3KvPfvf78JjqywVJFZxCgs5YOCAeF2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2013/8/19 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>

> I would like to agree on one common text, and adapt all packages
> accordingly. The exact wording can be discussed, the main goal is the
> unification. Here is a proposal:
>
> <...>
> What is your opinion on:
> a. the concept of this unification
> b. the wording proposed above
>

I also wondered at the free wording in all the multitude of packages. And
your proposal is a good try to solve the problem. As Arnout has pointed
out, it would also be nice to minimize the comment length, so
  - "needs" looks better than "requires";
  - "support" might well be dropped;
  - "thread" might be changed to "THREADS" if "support" is dropped.

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130821/1624dc42/attachment.html>
