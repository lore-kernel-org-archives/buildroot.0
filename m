From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Apr 2008 15:16:36 +0200
Subject: [Buildroot] advice on makefile
In-Reply-To: <20080412092510.GB15915@cloud.net.au> (Hamish Moffatt's message
	of "Sat\, 12 Apr 2008 19\:25\:10 +1000")
References: <1207827171.6817.432.camel@nigel-x60>
	<87tzi9apo6.fsf@macbook.be.48ers.dk>
	<1207836719.6817.433.camel@nigel-x60>
	<8763upaice.fsf@macbook.be.48ers.dk>
	<1207839098.6817.444.camel@nigel-x60>
	<20080412092510.GB15915@cloud.net.au>
Message-ID: <87ej9b1adn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> If we add .stamp_xxx to the build dir ... I guess my luck will run
 >> out ;)

 Hamish> Yep, that really sucks. Please, depend on files in the target
 Hamish> dir rather than on stamp files elsewhere. Unless you use
 Hamish> external toolchain I think nuking the root is already unsafe
 Hamish> :-(

Notice this was about files in STAGING_DIR (and providing a known
filename that other packages can depend on).

-- 
Bye, Peter Korsgaard
