From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 00:25:19 +0200
Subject: [Buildroot] 2017.08-rc1 approaching
In-Reply-To: <1501625976917-172676.post@n4.nabble.com>
References: <20170801233055.2488a4fc@windsurf.home>
 <1501625976917-172676.post@n4.nabble.com>
Message-ID: <20170802002519.2d4a742d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Aug 2017 15:19:36 -0700 (PDT), nimaim at gmail.com wrote:

> Just a request but I think it's important to finally get Qt 5.9.1 into this
> release, as it is probably the most popular cross-platform GUI framework
> today. It is the new LTS version and fixes a lot of the issues from older
> versions, even adding more embedded controls (Quick Controls 2). I am hoping
> someone can fix  this
> <http://buildroot-busybox.2317881.n4.nabble.com/Qt-5-9-1-QML-arm-crash-QTBUG-61522-td172524.html>  
> problem and push it up, and that you guys can commit it before releasing
> this RC. Unfortunately, I lack the knowledge and time to fix all the bugs
> currently present building this version but would be grateful if someone can
> look into it so we don't have to wait another 3 months to get a stable
> release with it in there. Thanks!

Well, Qt 5.9.1 is in Buildroot since 2 weeks already, and the fix for
the QML crash has been merged yesterday. So both of them will be in
2017.08-rc1, and the final 2017.08.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
