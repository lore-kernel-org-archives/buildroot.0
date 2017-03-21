From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Mar 2017 10:54:21 +0100
Subject: [Buildroot] [PATCH 06/16] ubus: add hash
In-Reply-To: <20170321104704.2eb2fa82@free-electrons.com>
References: <20170321000712.26500-1-arnout@mind.be>
 <20170321000712.26500-7-arnout@mind.be>
 <20170321104704.2eb2fa82@free-electrons.com>
Message-ID: <c8e8c6f5-6c98-4234-7fef-972ec7c64d37@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-03-17 10:47, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 21 Mar 2017 01:07:02 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> ubus had a hash file, but is says "none" because it is a git download.
>> Since our git downloads are not reproducible, we can actually add a
> 
> I guess you meant "are *now* reproducible", right? 

 Right. Looks like my fingers were quicker than my brains again.


> Ditto for the next
> commits. 

 Ah, the joys of 'git commit -c HEAD' :-)

 Regards,
 Arnout


> No need to resend just for that, it can be fixed up when
> applying.
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
