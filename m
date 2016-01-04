From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Jan 2016 22:39:07 +0100
Subject: [Buildroot] [PATCH 1/2] python3: switch to Git formatted patches
In-Reply-To: <8737udjbxw.fsf@dell.be.48ers.dk>
References: <1451931809-24511-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <8737udjbxw.fsf@dell.be.48ers.dk>
Message-ID: <568AE67B.4030308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-01-16 22:02, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > In preparation for the bump to Python 3.5.0, let's switch all the
>  > patches to the Git format. This way, a Git repository of the Python
>  > source code can be used to manage those patches, which makes it easier
>  > to bump to newer Python versions.
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> [snip]
> 
>>  delete mode 100644 package/python3/006-cross-compile-getaddrinfo.patch
> 
> Did you drop this patch on purpose?
> 

 It's been renamed 006 -> 0004 and rename detection didn't kick in.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
