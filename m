From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 23:33:50 +0100
Subject: [Buildroot] [PATCH next] 18xx-ti-utils: new package
In-Reply-To: <20180301223050.zdh7n2xfm3u5eqja@tarshish> (Baruch Siach's
 message of "Fri, 2 Mar 2018 00:30:50 +0200")
References: <d322743a2a05c94eb5e1403f726b2c55372df556.1519941102.git.baruch@tkos.co.il>
 <87fu5jfnem.fsf@dell.be.48ers.dk>
 <20180301223050.zdh7n2xfm3u5eqja@tarshish>
Message-ID: <87y3jbe88h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> Would it make sense to force this option on in linux.mk like we do for
 >> other packages?

 > I don't think so. I don't like this magic config manipulation in the general 
 > case. CONFIG_NL80211_TESTMODE in particular is meant for those who really know 
 > what they are doing. As the kernel config option help text put it:

 >   Say N.

OK. I agree that we should keep the "magic" kernel config tweaks to a
minimum.

-- 
Bye, Peter Korsgaard
