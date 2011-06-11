From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 11 Jun 2011 08:38:16 -0500
Subject: [Buildroot] Generic serial port disappear after udev started
In-Reply-To: <20110611104855.23b50569@skate>
References: <BANLkTinE9E==rnL=NJSKkW=SELY=bZbHJg@mail.gmail.com>
	<201106101349.34083.minimod@morethan.org>
	<20110611104855.23b50569@skate>
Message-ID: <201106110838.18557.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat June 11 2011, Thomas Petazzoni wrote:
> Le Fri, 10 Jun 2011 13:49:31 -0500,
> "Michael S. Zick" <minimod@morethan.org> a ?crit :
> 
> > Is /dev on nfs?
> > that might be the problem, nfs makes files, not device nodes.
> 
> Huh?
> 
> I routinely use root-over-NFS, including the /dev with static device
> nodes, and it works just fine.
> 

My bad.  I was going from memory of a recent thread but my recollection
of the previous problem report was evidently faulty. 
Previously: either 'works slow' or 'does not work'.
The other thread must have been: 'works slow'.

Mike
> Thomas
