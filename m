From: Darcy Watkins <dwatkins@tranzeo.com>
Date: Tue, 09 Nov 2010 10:37:33 -0800
Subject: [Buildroot] Buildroot Patches I Use [3] - ldconfig -N opt
In-Reply-To: <1289317856.30565.115.camel@tr-pentomino>
References: <1289317856.30565.115.camel@tr-pentomino>
Message-ID: <1289327853.2698.4.camel@tr-pentomino>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Well all the point of calling ldconfig at this point is to create this
>  cache. So if we add -N to disable the cache build, what's the point of
> calling ldconfig at all ?

Then I'm going to try building without the patch to see if it is OK to
toss it into the infinite bit sink.  Thx!

Darcy
