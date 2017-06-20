From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Jun 2017 14:40:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/imagemagick: change download
	url to github
In-Reply-To: <20170620141021.5ecdcd3e@windsurf.lan> (Thomas Petazzoni's
 message of "Tue, 20 Jun 2017 14:10:21 +0200")
References: <20170618074538.1237-1-bernd.kuhls@t-online.de>
 <877f09glcd.fsf@dell.be.48ers.dk>
 <20170619152921.6a37a345@windsurf.lan>
 <87efueg91o.fsf@dell.be.48ers.dk>
 <20170620141021.5ecdcd3e@windsurf.lan>
Message-ID: <871sqeg7dd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> > I indeed hadn't seen the stupid name for the tarball. On my side, I
 >> > find it a bit annoying that we have to rely on sources.b.o to make
 >> > things work, so having upstream location that are working on the long
 >> > run is much better when possible. But I agree that the tarball name is
 >> > really silly here, and the risk of conflict with other packages is real.  
 >> 
 >> That is exactly my concern. So what do we do? Leave it like this so
 >> s.b.o isn't needed or revert to get back a sane tarball name?
 >> 
 >> There's pro/cons to both, but I think I would prefer to revert.

 > Perhaps we could revert *and* talk to the upstream developers and ask
 > them to keep the tarballs at the same place, instead of (re)moving
 > them ?

That is certainly worth a try. It is imagemagick though, so you never
know. They seem to really remove all <version>-<minor> except the latest
<minor> in each series.

-- 
Bye, Peter Korsgaard
