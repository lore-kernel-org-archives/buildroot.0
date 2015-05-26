From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 26 May 2015 12:28:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: add patch to fix host
 build error with gcc 5.1
In-Reply-To: <20150526102011.GR2260@tarshish>
References: <1432634015-24079-1-git-send-email-joerg.krause@embedded.rocks>
 <20150526095730.GQ2260@tarshish> <1432635054.24186.3.camel@embedded.rocks>
 <20150526102011.GR2260@tarshish>
Message-ID: <1432636084.24186.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Di, 2015-05-26 at 13:20 +0300, Baruch Siach wrote:
> Hi J?rg,
> 
> On Tue, May 26, 2015 at 12:10:54PM +0200, J?rg Krause wrote:
> > On Di, 2015-05-26 at 12:57 +0300, Baruch Siach wrote:
> > > What is the upstream status of this patch?
> > 
> > Good question! I've seen now that Bernard Walle submitted the same
> > patch three weeks ago to the mtd mailing list [1]. No feedback so 
> > far.
> > 
> > [1]
> > https://patchwork.ozlabs.org/patch/467254/
> 
> Great. Please add this information to the commit log and the patch 
> description.
> 

Done.. :-)

[v2,1/1] package/mtd: add patch to fix host build error with gcc 5.1
http://patchwork.ozlabs.org/patch/476426/
