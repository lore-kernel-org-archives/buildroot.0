From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 21:12:36 +0200
Subject: [Buildroot] [PATCH 1/6] bzip2: improve the packaging
In-Reply-To: <878v2z9bgv.fsf@dell.be.48ers.dk>
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <878v2z9bgv.fsf@dell.be.48ers.dk>
Message-ID: <20130528211236.60c85da4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 28 May 2013 21:00:00 +0200, Peter Korsgaard wrote:

>  Thomas> This commit also makes sure that bzip2.mk behaves properly in a
>  Thomas> BR2_PREFER_STATIC_LIB=y context.
> 
> Committed to next, thanks.
> 
> It would be good if you could try to push the patch upstream.

I've just sent the patch, but I don't think there's much luck. bzip2 is
one of some open-source project that's mostly "done", so there isn't
much activity. Last release 2.5 years ago, no Git tree or even any VCS
at all.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
