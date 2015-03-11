From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Mar 2015 15:27:27 -0300
Subject: [Buildroot] Reduce toolchain options
In-Reply-To: <87385bmrc8.fsf@dell.be.48ers.dk>
References: <550069E9.5060403@zacarias.com.ar>
 <87385bmrc8.fsf@dell.be.48ers.dk>
Message-ID: <5500890F.7030700@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/2015 01:28 PM, Peter Korsgaard wrote:

> Yes, I agree.
> 
> I'm also somewhat scared of forcing IPv6 support but perhaps it will be
> safe, people using !uClibc have probably noticed these issues already.

I've found one downside of dropping non-IPv6: the codesourcery SH2A
toolchains lack IPv6 support :-(
We can still kill the LFS option though.
Regards.
