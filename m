From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Aug 2014 08:46:10 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <53FC6FB7.2000408@imgtec.com>
References: <20140826063010.01540101541@stock.ovh.net>
 <20140826092929.6787535b@free-electrons.com>
 <53FC6D1E.1060104@zacarias.com.ar> <53FC6FB7.2000408@imgtec.com>
Message-ID: <53FC7382.1020401@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/26/2014 08:29 AM, Vicente Olivert Riera wrote:

>> Hi.
>> It's a conflict between libev and libevent at work here, they both
>> install /usr/include/event.h hence causing issues.
>> Isn't that sweet?
>> I think i've got a solution, i'll send a patch shortly if it pans out.
>> Regards.
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
> Maybe this is the same problem that is causing tmux to fail:
> 
> http://autobuild.buildroot.net/results/24f/24f5d0c61b5283fe6ce58b11cb37813ce227fdc8/build-end.log
> 
> 
> https://sourceforge.net/p/tmux/tickets/152/

Indeed it is and it's fixed by the libev patch i've sent.
Do i get a beer or what for fixing multiple packages in one shot from a
sucky bug/assumption?
Regards.
