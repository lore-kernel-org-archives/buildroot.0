From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 11:19:08 +0100
Subject: [Buildroot] [PATCH] fs/tar: make --no-recursion effective
In-Reply-To: <20161228093220.kgnkh7r4eogp5wau@tarshish> (Baruch Siach's
 message of "Wed, 28 Dec 2016 11:32:21 +0200")
References: <a5d19ac14d835abbc645fef67aad61ce48e247b9.1482860523.git.baruch@tkos.co.il>
 <87o9zwbe95.fsf@dell.be.48ers.dk>
 <20161228093220.kgnkh7r4eogp5wau@tarshish>
Message-ID: <87bmvwbbkz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> I got a bit confused by this, as the manual explicitly shows the -T -
 >> --no-recursion sequence:
 >> 
 >> https://www.gnu.org/software/tar/manual/html_section/tar_54.html

 > That part of the tar manual looks wrong. The "Position-Sensitive Options"[1] 
 > section shows this example to illustrate the position sensitivity concept:

 >   tar -cf a.tar --recursion /usr --no-recursion /var/*

 > [1] https://www.gnu.org/software/tar/manual/html_section/tar_22.html#SEC44

Ahh, ok - Thanks.

-- 
Bye, Peter Korsgaard
