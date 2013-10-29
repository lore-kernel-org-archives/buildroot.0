From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 29 Oct 2013 23:02:29 +0100
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131029204108.5d707d09@skate>
References: <20131029204108.5d707d09@skate>
Message-ID: <CAM+bi4vODTx=Yerh+n=dBkAEf1N3H576rP=dp1X3Lw2Sw3_g0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all, hi Thomas

This is kind of an apology, for I am yet to review those few errors
compiling openssl for microblaze you noticed a couple of weeks ago.

I can currently spend about a 10% of my paid time to make sure the software
we code at our compay is cross platform and for that I use buildroot.
Little by little, I will be facing those bugs (specifically for arm,
powerpc microblaze, and maybe x86_64 and i686) and also will encounter the
need to build some new packages (such as libxmlrpc I sent a few days ago).

I can't promise any specific amount of direct effort to solve any specific
issue, but I just want you all to know that I keep them in mind and will
try to help out with them during the little time I can dedicate to
buildroot.

Hopefully, some of those bugs will be blocking my cross porting work and
then I'll be able to explain my boss why I spent my time solving them. I
wish I could spend more time to buildroot outside job, but for now that'll
be it.

Thank you all, regards



2013/10/29 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Hello all,
>
> This e-mail is intentionally Cc'ed to a number of people who are
> working on specific architectures in Buildroot, and specifically the
> architectures having the highest number of problems in the autobuilders.
>
> I generated some statistics of the number of failed builds vs.
> successful builds since July, 1st 2013, and here are the results
> (ordered from the worst architecture to the best one) :
>
> +------------+---------+----------+-------+------------+------------+
> | arch       | success | failures | total | pctsuccess | pctfailure |
> +------------+---------+----------+-------+------------+------------+
> | bfin       |      10 |      607 |   617 |     1.6207 |    98.3793 |
> | microblaze |       6 |      308 |   314 |     1.9108 |    98.0892 |
> | nios2      |       2 |       49 |    51 |     3.9216 |    96.0784 |
> | xtensa     |      13 |      314 |   327 |     3.9755 |    96.0245 |
> | avr32      |      34 |      305 |   339 |    10.0295 |    89.9705 |
> | mips64el   |     162 |      498 |   660 |    24.5455 |    75.4545 |
> | aarch64    |      82 |      243 |   325 |    25.2308 |    74.7692 |
> | arc        |      95 |      234 |   329 |    28.8754 |    71.1246 |
> | sh4a       |     158 |      171 |   330 |    47.8788 |    51.8182 |
> | mipsel     |     172 |      168 |   340 |    50.5882 |    49.4118 |
> | mips       |     172 |      165 |   337 |    51.0386 |    48.9614 |
> | arm        |    2302 |     1788 |  4097 |    56.1875 |    43.6417 |
> | powerpc    |    2794 |     1616 |  4411 |    63.3416 |    36.6357 |
> | sh4        |     208 |      120 |   328 |    63.4146 |    36.5854 |
> | x86_64     |     874 |      412 |  1288 |    67.8571 |    31.9876 |
> | i686       |    2369 |      572 |  2943 |    80.4961 |    19.4359 |
> +------------+---------+----------+-------+------------+------------+
>
> It would be really nice if the people working on those architectures in
> Buildroot could contribute a little bit more to fix the autobuilders
> failures, or at least get in touch with us to discuss how to solve
> them, or if they have no clue how to solve them.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131029/ad1590fa/attachment.html>
