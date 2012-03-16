From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Mar 2012 16:53:39 +0100
Subject: [Buildroot] curl sagmentatation fault - > is openssl the
	culprit ?
In-Reply-To: <F4A167A0B310422C906F05845738AE17@JohanW7>
References: <F4A167A0B310422C906F05845738AE17@JohanW7>
Message-ID: <201203161653.39678.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 16 March 2012 15:52:53 Sagaert Johan wrote:
> Hi
> 
> Things are not always what they seem:
> 
> It seems to me that when the configure script of curl runs it checks for openssh, if none is found
> Then it is build without openssl.

 Hm, could be.  Maybe try if other programs work with openssl, e.g. 
lighttpd (make sure you configure it to use openssl).

 But of course, that doesn't tell you what the real problem is...  You'll 
still need to get a strack trace.

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
