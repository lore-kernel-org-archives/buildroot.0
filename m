From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 06:51:30 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/pkg-infra
In-Reply-To: <87sjnfni6h.fsf@macbook.be.48ers.dk>
References: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
 <87sjnfni6h.fsf@macbook.be.48ers.dk>
Message-ID: <20110930065130.142d51bd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 29 Sep 2011 23:37:58 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> Therefore, if there is no serious review and consideration of this
>  Thomas> patchset, this will be the last posting of it. Of course, this
>  Thomas> patchset being a bit complicated and sensitive, I will definitely
>  Thomas> understand if there are review comments and I am ready to make the
>  Thomas> necessary changes. However, if it keeps being ignored, then I'll just
>  Thomas> give up on it at this point.
> 
> I understand your frustration. Real life unfortunately has gotten in the
> way of some of my buildroot time lately.

I also do understand real life issues, as I also haven't been able to
dedicate much time to Buildroot recently.

What I find particularly frustrating is the logic used to consider the
patches. For sure, reviewing simple patches is a lot easier, but I
think it's a lot more logical to handle complicated patchsets early in
the release process and then handle the simpler patches.

> Committed series with minor fixes like discussed on IRC, thanks!

Thanks! People, please test the latest Git and see if nothing breaks.
Some changes are fairly sensitive, and there might be some breakage. Do
not hesitate to report anything suspicious.

As soon as an action is taken on the asciidoc branch, I'll work on
updating the documentation.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
