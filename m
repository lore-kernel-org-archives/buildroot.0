From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 8 Oct 2014 10:37:57 +0100
Subject: [Buildroot] [PATCH] ser2net: Add a hash file
In-Reply-To: <20141008112001.2e0b8b9b@free-electrons.com>
References: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
 <1412692250-13513-2-git-send-email-Vincent.Riera@imgtec.com>
 <20141007192331.0908bbcd@free-electrons.com> <5434FC83.3070303@imgtec.com>
 <20141008112001.2e0b8b9b@free-electrons.com>
Message-ID: <543505F5.4080805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 10:20 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Wed, 8 Oct 2014 09:57:39 +0100, Vicente Olivert Riera wrote:
> 
>>> Why having all those hashes?
>>
>> Why not? Those are all the hashes supported in Buildroot. The more we 
>> have the better.
> 
> I disagree: more hashes means more work to do when bumping the package.
> Either one strong hash, or two weaker hashes should be sufficient IMO.
> 
> Something to be discussed at the meeting maybe?

I am curious, what's the point of supporting more than one hash types?
Why not support only the strongest one?

-- 
markos
