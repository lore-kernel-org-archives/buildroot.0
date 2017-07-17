From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Jul 2017 09:20:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-07-15
In-Reply-To: <eb108213-fb03-12bf-bcf8-c33cabca92e4@gmail.com>
References: <20170716063402.6FE6320DF3@mail.free-electrons.com>
 <eb108213-fb03-12bf-bcf8-c33cabca92e4@gmail.com>
Message-ID: <20170717092042.56cd394d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Jul 2017 17:57:50 +0200, Romain Naour wrote:

> >       mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/36d5a4838197bfffcbc8dea84e6cfa5f3a87949d |     
> >      powerpc | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/7e2bd71b2776f9b8d13812b456ffd3181cd86535 |       
> 
> efl, trinity maybe other packages are affected by an issue fixed by [1].
> 
> Can you rebuild the toolchains used in autobuilders ?

I have rebuilt and deployed new toolchains yesterday:

  https://git.buildroot.org/buildroot-test/commit/?id=124124b89e8b5cb541d7da3196b28505a63ae9dd

So all toolchains with the version 2017.05-1078-g95b1dae should no
longer have this problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
