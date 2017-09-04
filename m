From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 04 Sep 2017 22:30:01 +0200
Subject: [Buildroot] [PATCH v2 1/1] New board: SolidRun ClearFog Base
In-Reply-To: <20170904174220.xeweolump7hsgfqm@tarshish>
References: <20170904104128.rbpp3qjkgyi6kafu@sapphire.tkos.co.il>
 <286913cf8082a174d123f2581b9e61ad5250d8b7.1504541978.git.jan.kundrat@cesnet.cz>
 <20170904174220.xeweolump7hsgfqm@tarshish>
Message-ID: <6bf8fe54-ece2-4dd7-8675-0d59e764d633@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This information belongs (also) in the readme.txt file, I believe.

Right, I've added this in v3.

> As far as I know all eMMC SOMs are pre-loaded with a 
> bootloader. But you are 
> right that this README doesn't cover these.

I didn't know that. In fact, I specifically ordered the no-eMMC version 
based on the information on the web in order to make my life easier. 
Thanks. I'll leave the comment as-is for now though.

> These DIP switches settings looks exactly the same as in the wiki page[1]. 
> Note the comment below the diagram.

You're right. However, the PDF manual on the web [1] mentions 11000 on page 
10.

[1] 
https://wiki.solid-run.com/lib/exe/fetch.php?media=a38x:carrierboard:docs:sr-a38x-clearfog_base-manual-rev1.1.pdf
