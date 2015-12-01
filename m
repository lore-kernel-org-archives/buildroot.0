From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2015 23:08:42 +0100
Subject: [Buildroot] [PATCH] busybox: add another upstream patch to fix
	unzip
In-Reply-To: <87y4ddj0k5.fsf@dell.be.48ers.dk>
References: <1449001829-26507-1-git-send-email-arnout@mind.be>
 <20151201223025.0b777fd7@free-electrons.com>
 <87y4ddj0k5.fsf@dell.be.48ers.dk>
Message-ID: <565E1A6A.2030707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-12-15 22:55, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Arnout, Peter,
>  > On Tue, 1 Dec 2015 21:30:29 +0100, Arnout Vandecappelle
>  > (Essensium/Mind) wrote:
>  >> 0002-unzip.patch which was added in 69516e0 to fix a segmentation
>  >> fault in the gunzip applet. However, it introduced a new issue that
>  >> made the unzipping of some files fail.
>  >> 
>  >> Add an upstream patch that fixes this new issue.
>  >> 
>  >> Fixes #8501.
>  >> 
>  >> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  >> Cc: Jason Rush <rush0033@hotmail.com>
> 
>  > It is really nasty to have this problem affecting 2015.11 in such a
>  > fundamental package IMO, so I would like to suggest to merge this and
>  > release 2015.11.1 with the fix.
> 
>  > Sad to have to do this just one day after 2015.11 release, but it's
>  > really not great to have such a major issue left in 2015.11.
> 
> No, indeed not :/ And the patch was even an upstream fix. Where does
> this new patch come from, I don't see it on
> http://busybox.net/downloads/fixes-1.24.1/?

 I took it straight from git.

 Regards,
 Arnout

> 
> While this is an important thing to fix, I don't think it is urgent
> enough to release a 2015.11.1 right away. It sounds like we might need a
> fix for the host rpath checks as well, so I'll wait a few days to see
> what shows up.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
