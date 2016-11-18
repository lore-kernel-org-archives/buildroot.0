From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 09:45:47 +0100
Subject: [Buildroot] [PATCH 02/10] core: add waf-package infra
In-Reply-To: <671071c5-0fba-8834-3837-7f7ff5cf82fa@mind.be>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <6556713514fd3c751384c5ea655420dba5e8876a.1477843328.git.yann.morin.1998@free.fr>
 <20161117000239.36cd4e77@free-electrons.com>
 <671071c5-0fba-8834-3837-7f7ff5cf82fa@mind.be>
Message-ID: <20161118094547.08f2f956@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 00:52:58 +0100, Arnout Vandecappelle wrote:

>  Well, it makes sense to me that a package infra does something like that, but
> less so that the waf package itself would do it. And it's just simpler if the
> dependency is only in the infra.
> 
>  However, I wonder if we need this dependency at all. We already require a
> python (although admittedly we don't check the version). The few packages that
> don't support python3 can add the dependency themselves. Building host-python
> really eats into the build time...

Is waf python2/python3 compliant?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
