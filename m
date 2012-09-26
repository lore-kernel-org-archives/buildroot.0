From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 26 Sep 2012 08:23:48 +0200
Subject: [Buildroot] [PATCH 1/1] allow to pass the number of parallel
 jobs via command line
In-Reply-To: <87txul7sbc.fsf@macbook.be.48ers.dk>
References: <1348568223-13874-1-git-send-email-plagnioj@jcrosoft.com>
 <87txul7sbc.fsf@macbook.be.48ers.dk>
Message-ID: <20120926062348.GA31527@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22:36 Tue 25 Sep     , Peter Korsgaard wrote:
> >>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:
> 
>  Jean-Christophe> use PARALLEL_JOBS=x for this
>  Jean-Christophe> This will overwrite the value in BR2_JLEVEL
> 
> why not just use make BR2_JLEVEL=x ?
> 
kconfig overwrite and you can not optarg env as BR2_JLEVEL is a int

so need to use PARALLEL_JOBS

Best Regards,
J.
> -- 
> Bye, Peter Korsgaard
