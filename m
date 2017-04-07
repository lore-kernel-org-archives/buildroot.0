From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Apr 2017 13:11:30 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <20170407124314.660c3edc@free-electrons.com>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
 <39bc6b12-1dfd-8ada-f1bc-8597c6872a1c@mind.be> <20170404185928.GA3828@scaer>
 <fd9c07fd-2e86-ed73-2fd1-bfcf27522664@mind.be>
 <20170407124314.660c3edc@free-electrons.com>
Message-ID: <7a42ae1e-bfcf-7e31-04f0-a66fea3c6016@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-04-17 12:43, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 7 Apr 2017 12:30:46 +0200, Arnout Vandecappelle wrote:
> 
>>> Well, I've been tracking build-order issues for a while last WE, and
>>> believe me, I was very happy to be able to see the build order before
>>> I attempted a build, yes.  
>>
>>  That's my biggest problem with this feature: I have no idea how to use it.
>> Could you add some explanation somewhere?
> 
> Yann was tracking down the dc3dd failure. With some configurations it
> was building, with others not. So he was trying to figure which package
> that gets built before dc3dd causes the problem. For this, it was
> really nice to be able to load a configuration, and immediately see in
> which order packages would be built, and therefore which packages would
> be built before dc3dd, without having to do the build itself.
> 
> Does that explain better the use case for this?

 Ack. Could you add that to the commit message while applying?

 Regards,
 Arnout

> 
> Best regards,
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
