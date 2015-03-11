From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 21:23:47 +0100
Subject: [Buildroot] Reduce toolchain options
In-Reply-To: <5500890F.7030700@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 11 Mar 2015 15:27:27 -0300")
References: <550069E9.5060403@zacarias.com.ar>
 <87385bmrc8.fsf@dell.be.48ers.dk> <5500890F.7030700@zacarias.com.ar>
Message-ID: <87h9trl1v0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 03/11/2015 01:28 PM, Peter Korsgaard wrote:
 >> Yes, I agree.
 >> 
 >> I'm also somewhat scared of forcing IPv6 support but perhaps it will be
 >> safe, people using !uClibc have probably noticed these issues already.

 > I've found one downside of dropping non-IPv6: the codesourcery SH2A
 > toolchains lack IPv6 support :-(

Ahh, that might indeed be a problem for external uClibc based
toolchains.

> We can still kill the LFS option though.

Yeah.

-- 
Bye, Peter Korsgaard 
