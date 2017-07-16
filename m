From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 16 Jul 2017 17:57:50 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-07-15
In-Reply-To: <20170716063402.6FE6320DF3@mail.free-electrons.com>
References: <20170716063402.6FE6320DF3@mail.free-electrons.com>
Message-ID: <eb108213-fb03-12bf-bcf8-c33cabca92e4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 16/07/2017 ? 08:34, Thomas Petazzoni a ?crit :
> Hello,
> 
> Build statistics for 2017-07-15
> ================================
> 
>       successes : 87 
>        failures : 24 
>        timeouts : 2  
>           TOTAL : 113
> 
> Classification of failures by reason
> ====================================

> make[1]: *** wait: No child... | 2 
> 
> 
> Detail of failures
> ===================
> 
>       mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/36d5a4838197bfffcbc8dea84e6cfa5f3a87949d |     
>      powerpc | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/7e2bd71b2776f9b8d13812b456ffd3181cd86535 |     

efl, trinity maybe other packages are affected by an issue fixed by [1].

Can you rebuild the toolchains used in autobuilders ?

Thanks!

Best regards,
Romain

[1]
https://git.buildroot.net/buildroot/commit/?id=e91f959e840f94df12d6df19907a8e8c4a067f93
