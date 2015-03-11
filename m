From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Mar 2015 18:43:33 -0300
Subject: [Buildroot] Reduce toolchain options
In-Reply-To: <20150311214445.06b12508@free-electrons.com>
References: <550069E9.5060403@zacarias.com.ar>	<87385bmrc8.fsf@dell.be.48ers.dk>	<5500890F.7030700@zacarias.com.ar>
 <20150311214445.06b12508@free-electrons.com>
Message-ID: <5500B705.2020608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/2015 05:44 PM, Thomas Petazzoni wrote:

> As you say, it's 2015, so maybe we should just drop this toolchain. Or
> at least deprecate it now so that we can get rid of it in the future.

I've considered that, but then recalled our internal SH toolchains
aren't up to snuff.
On the other hand it's a nommu sh target, how many people use this?
Regards.
