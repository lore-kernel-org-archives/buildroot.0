From: Lubomir Rintel <lkundrak@v3.sk>
Date: Fri, 06 Sep 2019 11:24:55 +0200
Subject: [Buildroot] [PATCH] less: set PAGER variable
In-Reply-To: <20190903103809.1d52ff66@windsurf.home>
References: <20190902133955.9541-1-lkundrak@v3.sk>
 <20190903103809.1d52ff66@windsurf.home>
Message-ID: <7fdd3485768551e7b76670329402c4d20cd4aab7.camel@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2019-09-03 at 10:38 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,  2 Sep 2019 15:39:55 +0200
> Lubomir Rintel <lkundrak@v3.sk> wrote:
> 
> > The system/skeleton/etc/profile sets PAGER to /bin/more. Not sure why,
> > but this defeats pager autodetection by various tool (systemctl, nmcli,
> > etc.) that would otherwise prefer less to more.
> 
> Perhaps we should simply remove the PAGER definition in etc/profile, then ?

That indeed seems to be a better idea.

> In any case, your patch lacks an SoB.
> 
> Thanks,
> 
> Thomas

Thanks
Lubo
