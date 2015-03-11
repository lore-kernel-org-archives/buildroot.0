From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 21:44:45 +0100
Subject: [Buildroot] Reduce toolchain options
In-Reply-To: <5500890F.7030700@zacarias.com.ar>
References: <550069E9.5060403@zacarias.com.ar>
 <87385bmrc8.fsf@dell.be.48ers.dk>
 <5500890F.7030700@zacarias.com.ar>
Message-ID: <20150311214445.06b12508@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 11 Mar 2015 15:27:27 -0300, Gustavo Zacarias wrote:

> I've found one downside of dropping non-IPv6: the codesourcery SH2A
> toolchains lack IPv6 support :-(

As you say, it's 2015, so maybe we should just drop this toolchain. Or
at least deprecate it now so that we can get rid of it in the future.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
