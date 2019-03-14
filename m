From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Mar 2019 12:03:35 +0100
Subject: [Buildroot] [PATCH v2 00/13] ppsh compatible Qt5 / generic
 qmake target install
In-Reply-To: <20190314094024.1961-1-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
Message-ID: <46b2d555-ef74-b20d-1d51-8ef54c23604a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/03/2019 10:40, Andreas Naumann wrote:
> - I have tested with Qt5.12.1 only. Qt5.6 should but might not always do the right
>   thing. However I think it was decided to remove support for 5.6 anyway.?

 The plan was to remove 5.6 after it has gone EOL, which is supposed to be in
March 2019 (3 years after the initial release in March 2016). So, the plan was
to still update to 5.6.4, include that in Buildroot 2019.05 and 2019.02.x, and
remove it after 2019.05.

 However, on the release wiki [1] I now see

Phase 	Original plan 	Updated plan 	Realized
5.6.4 	Not yet defined 		Won't be done at all

so maybe we can expedite the removal.

 Regards,
 Arnout

[1] https://wiki.qt.io/Qt_5.6_Release
