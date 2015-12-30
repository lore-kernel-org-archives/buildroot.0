From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Dec 2015 21:48:20 +0100
Subject: [Buildroot] [PATCH 0/4 v2] Do not select providers of virtual
	packages (branch yem/dont-select-providers)
In-Reply-To: <20151218220532.515e1b50@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 18 Dec 2015 22:05:32 +0100")
References: <cover.1450391976.git.yann.morin.1998@free.fr>
 <20151218220532.515e1b50@free-electrons.com>
Message-ID: <87poxnwtm3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> Dear Yann E. MORIN,
> On Thu, 17 Dec 2015 23:40:23 +0100, Yann E. MORIN wrote:

>> Yann E. MORIN (4):
>> package/dnsmasq: do not select Lua, depend on it
>> package/haserl: do not select Lua, depend on it
>> package/lighttpd: do not select Lua, depend on it

> Those three patches applied, thanks!

Should these lua suboptions perhaps now be enabled by default if lua is
available (E.G. default y)?

-- 
Bye, Peter Korsgaard
