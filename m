From: Patrick <kpa_info@yahoo.fr>
Date: Mon, 11 Feb 2013 15:40:36 +0000 (GMT)
Subject: [Buildroot] [RFC] Python 3 external packages support
In-Reply-To: <20130211162231.0ac06f9c@skate>
References: <1360594442.60393.YahooMailNeo@web171801.mail.ir2.yahoo.com>
 <20130211160908.2da60098@skate>
 <1360595860.22602.YahooMailNeo@web171805.mail.ir2.yahoo.com>
 <20130211162231.0ac06f9c@skate>
Message-ID: <1360597236.46911.YahooMailNeo@web171802.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




On Mon, 11 Feb 2013 15:17:40 +0000 (GMT), Patrick wrote:
> 
> > If we make them exclusive, then we can ensure that
> > $(HOST_DIR)/usr/bin/python is either a symbolic link to python2
> > (when Python 2 is used) or a symbolic link on python3 (when Python
> > 3 is used), and that should make the thing work pretty smoothly.
> 
> 
> Indeed, if we dont need to support both simultaeously it simple.
> I will work on this.
> 
> Patrick
> 

One more question,

Does it sounds accetable to move all the Python related stuff (python2, python3 and all python-* packages) to a single directory called python ?
I know that you would like to have a flat arborescence for all packages, but this will help to provide a more friendly python menu

Thanks for your feedback

Patrick
