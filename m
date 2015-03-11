From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Mar 2015 18:42:20 -0300
Subject: [Buildroot] Reduce toolchain options
In-Reply-To: <20150311214543.597e639b@free-electrons.com>
References: <550069E9.5060403@zacarias.com.ar>
 <20150311214543.597e639b@free-electrons.com>
Message-ID: <5500B6BC.9010702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/2015 05:45 PM, Thomas Petazzoni wrote:

>> It's 2015 after all, and the size delta is minor:
>>
>> tar file delta, arm926 uclibc+busybox
>> =====================================
>> Threading (NPTL)        +153600 bytes
> 
> Ah, too bad. I was hoping to also suggest to remove the no-thread
> solution. The number of packages that need threads these days is really
> enormous, and I'm not really sure in practice how many people are doing
> no-thread based systems.

I posted the numbers to get some opinions on the others.
Locale is potentially big because of all the message translations so i
didn't even size it.
Regards.
