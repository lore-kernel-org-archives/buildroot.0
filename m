From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 13 Dec 2013 09:33:57 +0000
Subject: [Buildroot] [PATCH v3] knock: Fix build failure due to missing
	README file.
In-Reply-To: <87bo0l1y5p.fsf@dell.be.48ers.dk>
References: <1386851218-19360-1-git-send-email-Vincent.Riera@imgtec.com>
 <871u1i2lhm.fsf@dell.be.48ers.dk> <52AA38BC.2020407@mind.be>
 <87bo0l1y5p.fsf@dell.be.48ers.dk>
Message-ID: <52AAD485.5040306@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/12/2013 10:50 PM, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>   >  Hi Vicente,
>   > On 12/12/13 15:27, Peter Korsgaard wrote:
>   >> With that fixed the patch is not needed (as the README -> README.md
>   >> rename only happeneded after 7666f2):
>
>   >  But of course, your patch is still relevant to send upstream!
>
> It afaik is already included upstream, which is why the patch no longer
> applied.
>

Yes, I sent a pull request upstream and they merged it. If you have 
updated the knock.mk to use the latest git, then we don't need any patch 
because it's already applied upstream :-)

-- 
Vincent
