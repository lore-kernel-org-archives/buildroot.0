From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 20:53:34 +0200
Subject: [Buildroot] [PATCH 0/5] a few more runtime test cases for
 python packages - series 1/n
In-Reply-To: <20181011204244.2392f065@windsurf>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
 <20181011204244.2392f065@windsurf>
Message-ID: <20181011205334.0ee9b50d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 20:42:44 +0200, Thomas Petazzoni wrote:

> > Ricardo Martincoski (5):
> >   support/testing: add python-autobahn tests
> >   support/testing: add python-txaio tests
> >   support/testing: add python-txtorcon tests
> >   support/testing: add python-incremental tests
> >   support/testing: add python-twisted tests  
> 
> I have applied the entire series. I however have a few
> comments/suggestions, I'll reply to the individual patches.

I forgot to say that on the python-twisted tests, I did adjust the
sleep + timeout as you suggested before applying the patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
