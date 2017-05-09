From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 May 2017 11:46:19 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-08
In-Reply-To: <CAGm1_ktz8-x5g=bHt9-Hi88Vo3eb_VyR2TmaamLcKwNzB5PGWQ@mail.gmail.com>
References: <20170509062824.6D04D208E1@mail.free-electrons.com>
 <20170509093537.5560182b@free-electrons.com>
 <CAGm1_ktz8-x5g=bHt9-Hi88Vo3eb_VyR2TmaamLcKwNzB5PGWQ@mail.gmail.com>
Message-ID: <20170509114619.727892c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 May 2017 11:20:19 +0200, Yegor Yefremov wrote:

> > error: Name clash for '<pstage/lib>libboost_system.a'
> >
> > Yegor, you are in the DEVELOPERS file for Boost, could you have a look ?  
> 
> OMG I'm the only one registered as DEVELOPER for boost.

Good luck :-)

Feel free to find other volunteers to maintain this wonderful package!

> This situation seems to occur, when both iconv and icu are selected:
> 
>     - iconv (libc)             : yes
>     - icu                      : yes
> 
> Need to dig further.

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
