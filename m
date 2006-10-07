From: Ashok Shankar Das <ashok.s.das@gmail.com>
Date: Sat, 7 Oct 2006 20:23:52 +0530
Subject: [Buildroot] Networking apps not working
In-Reply-To: <200610040935.33205.vapier@gentoo.org>
References: <8032e0b00609301044s489c6efboc8754ce5309a6a9@mail.gmail.com>
	<452175C3.3080608@mvista.com>
	<8032e0b00610031251p81339afy6d906989e5df3632@mail.gmail.com>
	<200610040935.33205.vapier@gentoo.org>
Message-ID: <8032e0b00610070753n74e4fa04yf0aae1d164741213@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

On 10/4/06, Mike Frysinger <vapier@gentoo.org> wrote:
> keep replies on the list
> -mike
>
>
>
The problem I figured out is "route" incorectly sets the default gateway.
To overcome What I did is
* route del default
*route add -net 0.0.0.0 gw 192.168.0.1 netmask 0.0.0.0
and it solved the problem

Well has anybody faced the same problem?

-- 
Thanks
Ashok.
-------------
