From: Paul Jones <paul.jones@iwtech.com.au>
Date: Fri, 09 Apr 2010 19:27:16 +1000
Subject: [Buildroot] Qt IBase error
In-Reply-To: <n2jf70863321004090137qa0f54bb7w8708b78e95bb47ce@mail.gmail.com>
References: <n2jf70863321004090137qa0f54bb7w8708b78e95bb47ce@mail.gmail.com>
Message-ID: <4BBEF2F4.2040704@iwtech.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/09/10 18:37, Muhammed ER wrote:
> Hi,
> I am using Buildroot on mini2440 board. I need to use SQL in Qt. When
> I add IBASE in Qt, It gives me this error message;

I have the same problem. The configure script does a check to test
linking against the target mysql libs, but it links against the host
ones instead which causes the linker to stop with an invalid format error.

I don't know what the solution is yet.


Paul.
