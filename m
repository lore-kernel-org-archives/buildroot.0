From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 16 Dec 2013 14:39:32 +0000
Subject: [Buildroot] [PATCH v3] knock: Fix build failure due to missing
	README file.
In-Reply-To: <87haadyswh.fsf@dell.be.48ers.dk>
References: <1386851218-19360-1-git-send-email-Vincent.Riera@imgtec.com>
 <871u1i2lhm.fsf@dell.be.48ers.dk> <52AA38BC.2020407@mind.be>
 <87bo0l1y5p.fsf@dell.be.48ers.dk> <52AAD485.5040306@imgtec.com>
 <87haadyswh.fsf@dell.be.48ers.dk>
Message-ID: <52AF10A4.6050609@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/13/2013 09:58 AM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
> Hi,
>
>   >> >  But of course, your patch is still relevant to send upstream!
>   >>
>   >> It afaik is already included upstream, which is why the patch no longer
>   >> applied.
>   >>
>
>   > Yes, I sent a pull request upstream and they merged it. If you have
>   > updated the knock.mk to use the latest git, then we don't need any
>   > patch because it's already applied upstream :-)
>
> True, but the same applies with the current version we're using as that
> is from before the README -> README.md rename.

Oh, I understand now... You changed the git version of this package to 
downgrade it just to the point before the README -> README.md was made.

> If you have tested the latest git then you are welcome to send a patch
> bumping the version.
>

Yes, I have tested it, but it's easier for you to just change the 
version to the last git commit number.

-- 
Vincent
