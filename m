From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 06 Mar 2012 09:16:25 -0800
Subject: [Buildroot] [support.osuosl.org #20368] Re: Buildroot
	2012.02-rc3 released
In-Reply-To: <rt-3.6.3-2614-1330988102-1965.20368-6-0@osuosl.org>
References: <RT-Ticket-20368@osuosl.org> <87ehtg2r6n.fsf@macbook.be.48ers.dk>
 <201203010017.12296.arnout@mind.be>
 <CAJJ6jxvuCDspQ7eFe=1-=Zp00PygaFcXkyNh20sPsiAN77h3zQ@mail.gmail.com>
 <201203010100.03660.arnout@mind.be>
 <CAJJ6jxvVLYcoRgdtRbt6=CwFU2w_Wo-ASK5tHpOh7TT-ZYfQfw@mail.gmail.com>
 <4F4EF091.8030906@gmail.com>
 <CAJJ6jxtaJwjGSrn5GUH29bu+=gu3UyM2p+a3W2Onk6Gg=N9_OA@mail.gmail.com>
 <87mx7wwb4u.fsf@macbook.be.48ers.dk>
 <rt-3.6.3-2614-1330988102-1965.20368-6-0@osuosl.org>
Message-ID: <4F564669.1050009@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/2012 02:55 PM, Rudy Grigar via RT wrote:
> On Sun Mar 04 17:04:47 2012, jacmet at sunsite.dk wrote:
>>>>>>> "Steve" == Steve Calfee<stevecalfee@gmail.com>  writes:
>> Hi,
>>
>> Some buildroot users (Steve is one of them) are still experiencing DNS
>> related issues after the uclibc.org DNS move (*.buildroot.net are CNAMEs
>> to buildroot.uclibc.org). The fixes of last week unfortunately didn't
>> seem to solved the problem, could you take a look again?
>>
>> Thanks.
>>
>>   Steve>  Hi all,
>>   Steve>  Something is seriously messed up with DNS. After the osuosl guys
>>   Steve>  "fixed" it, I can no longer access  wget
>>   Steve>  'http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3' at
>>   Steve>  work, which was working, briefly before that.
>>
>>   Steve>  So now I cannot access git.buildroot.net from 3 separate isps. All
>>   Steve>  three local networks are NATed, two have a wireless router as the
>>   Steve>  gateway. I don't think this is a rare configuration. I have not had
>>   Steve>  this problem accessing any http server or of several git servers.
>>
>>   Steve>  It would really be nice to git fetch the latest release!
>>
>>   Steve>  Regards, Steve
>>
>
> I have noticed on certain clients that cname->cname records caused weird results.  I moved
> buildroot.uclibc.org to an A record to prevent the cname->cname:
>
> git.buildroot.net is an alias for buildroot.uclibc.org.
> buildroot.uclibc.org has address 140.211.167.224
>
> Let me know if this fixes the dns issues (note: the ttl is 24 hours).
>
> Thanks,
> Rudy
For everyone's info, I waited 24 hours and can now successfully connect 
to the link above and git fetch again! So whatever osuosl did this time 
seems to work. I have tried on two isp networks, both att uverse and a 
work isp successfully.

Regards, Steve
