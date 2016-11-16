From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Nov 2016 08:12:35 -0300
Subject: [Buildroot] [PATCH] PHP: bump to 7.0.13
In-Reply-To: <38121FAB319C3344930C920E7B518313886B225E@HHMAIL01.hh.imgtec.org>
References: <20161116092744.7827-1-ishitatsuyuki@gmail.com>
 <38121FAB319C3344930C920E7B518313886B225E@HHMAIL01.hh.imgtec.org>
Message-ID: <d2740430-f645-4e4c-86aa-4cce32ed7ec4@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/11/16 06:38, Vincent Olivert Riera wrote:

> Hello Tatsuyuki,
>
> php has been already bumped to 7.0.13 in the next branch:
>
> https://git.busybox.net/buildroot/commit/?h=next&id=cd59cb6b388d00865d0084e6a25eb306c0b5fdd3
>
> Is there any reason to bump it for master as well? If so, please tell us and if the reason is valid a maintainer will cherry-pick the patch from the next branch.
>
> Regards,
>
> Vincent.

Hi Vincent.
It's a security release, you gotta read the ChangeLog more often:
http://www.php.net/ChangeLog-7.php#7.0.13
They usually don't wait for CVE assignments or ask for them after the 
release, hence no references in it.
Sometimes looking at the oss-security mailing lists helps.
Regards.
