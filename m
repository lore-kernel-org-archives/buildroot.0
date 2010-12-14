From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 17:00:44 +0100
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <4D07922D.9090309@carallon.com>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
	<20101214142544.7863d2d2@surf>
	<AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>
	<20101214150520.253b9bae@surf>
	<AANLkTi=YP74FxwLhGyYo7gn5WFpR6PK8Qqw4UTWTE08N@mail.gmail.com>
	<20101214154228.51a969b6@surf>
	<AANLkTikOXep3YnuzHai4fzM-QEGb8BqSZvPsdRvQ_Hkc@mail.gmail.com>
	<20101214160558.325cddcb@surf>
	<AANLkTinQYpMH5VVCiXwLpN4io7rh=VaML+AX3yAOD5_F@mail.gmail.com>
	<4D07922D.9090309@carallon.com>
Message-ID: <20101214170044.674c2d0d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Dec 2010 15:50:05 +0000
William Wagner <will_wagner@carallon.com> wrote:

> I have also seen this. In my case the problem was that I had built an 
> eglibc toolchain that had configured too much out (I think it was option 
> OPTION_EGLIBC_NIS). Busybox built fine, only login as root failed.
> 
> Never got around to debugging it as much faster just to change my 
> toolchain to include the necessary option.

Yes, but in his case, he is using a well-known CodeSourcery toolchain,
which I also tested, and which works.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
