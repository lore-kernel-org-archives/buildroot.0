From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 09:21:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-08-07
In-Reply-To: <CAGm1_kvHgEDQrs0bjMNO94pMvS2WgBDU8G8W956mT3MTe8u+oQ@mail.gmail.com>
References: <20160808063030.7B3041016DF@stock.ovh.net>
 <CAGm1_kvHgEDQrs0bjMNO94pMvS2WgBDU8G8W956mT3MTe8u+oQ@mail.gmail.com>
Message-ID: <20160819092108.7b175cec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 07:29:29 +0200, Yegor Yefremov wrote:

> >       x86_64 |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/2a67d1580787e9fe2781bf2db91bb5e3e23ab2ea/  
> 
> Have opened an issue: https://github.com/giampaolo/psutil/issues/872
> 
> Any idea how to properly fix this issue?

I would suggest you to ask on the musl mailing list. They are the ones
knowing best how to deal with this conflicting header issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
