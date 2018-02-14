From: Pierre <pinaraf@pinaraf.info>
Date: Wed, 14 Feb 2018 09:44:39 +0100
Subject: [Buildroot] [PATCH 1/1] Add first KF5 packages
In-Reply-To: <hrvclexdar.ln2@ID-313208.user.individual.net>
References: <20180213213531.22910-1-pinaraf@pinaraf.info>
 <hrvclexdar.ln2@ID-313208.user.individual.net>
Message-ID: <2412544.jXCSD0vXVS@pierred-pdoc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, February 14, 2018 6:59:45 AM CET Bernd Kuhls wrote:
> Am Tue, 13 Feb 2018 22:35:31 +0100 schrieb Pierre Ducroquet:
> > This first commit introduce the kf5 packages folder and the first two
> 
> > KF5 packages:
> Hi Pierre,
> 
> according to the buildroot manual[1], section 17.1, new subdirectories,
> like package/kf5/, are discouraged, please add the new packages directly
> to package/.
> 
> Regards, Bernd

Hi

If I package every KF5 library that can be used outside a full featured 
desktop environment, there will be more than 30 libraries (they split the 
libraries in several tiers, and tier 1 contains 32 libraries). Grouping them 
in a subdirectory made more sense to me.
But if it's the rule, I will comply. How should I, under this restriction, 
share makefile variables (like KF5_VERSION) between the packages ?

Thanks

 Pierre
